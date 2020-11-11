$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- sshkey.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ sshkey.c
@@ -275,10 +275,10 @@ sshkey_size(const struct sshkey *k)
 	case KEY_RSA1:
 	case KEY_RSA:
 	case KEY_RSA_CERT:
-		return BN_num_bits(k->rsa->n);
+		return RSA_bits(k->rsa);
 	case KEY_DSA:
 	case KEY_DSA_CERT:
-		return BN_num_bits(k->dsa->p);
+		return DSA_bits(k->dsa);
 	case KEY_ECDSA:
 	case KEY_ECDSA_CERT:
 		return sshkey_curve_nid_to_bits(k->ecdsa_nid);
@@ -478,11 +478,7 @@ sshkey_new(int type)
 	case KEY_RSA1:
 	case KEY_RSA:
 	case KEY_RSA_CERT:
-		if ((rsa = RSA_new()) == NULL ||
-		    (rsa->n = BN_new()) == NULL ||
-		    (rsa->e = BN_new()) == NULL) {
-			if (rsa != NULL)
-				RSA_free(rsa);
+		if ((rsa = RSA_new()) == NULL) {
 			free(k);
 			return NULL;
 		}
@@ -490,13 +486,7 @@ sshkey_new(int type)
 		break;
 	case KEY_DSA:
 	case KEY_DSA_CERT:
-		if ((dsa = DSA_new()) == NULL ||
-		    (dsa->p = BN_new()) == NULL ||
-		    (dsa->q = BN_new()) == NULL ||
-		    (dsa->g = BN_new()) == NULL ||
-		    (dsa->pub_key = BN_new()) == NULL) {
-			if (dsa != NULL)
-				DSA_free(dsa);
+		if ((dsa = DSA_new()) == NULL) {
 			free(k);
 			return NULL;
 		}
@@ -536,21 +526,10 @@ sshkey_add_private(struct sshkey *k)
 	case KEY_RSA1:
 	case KEY_RSA:
 	case KEY_RSA_CERT:
-#define bn_maybe_alloc_failed(p) (p == NULL && (p = BN_new()) == NULL)
-		if (bn_maybe_alloc_failed(k->rsa->d) ||
-		    bn_maybe_alloc_failed(k->rsa->iqmp) ||
-		    bn_maybe_alloc_failed(k->rsa->q) ||
-		    bn_maybe_alloc_failed(k->rsa->p) ||
-		    bn_maybe_alloc_failed(k->rsa->dmq1) ||
-		    bn_maybe_alloc_failed(k->rsa->dmp1))
-			return SSH_ERR_ALLOC_FAIL;
 		break;
 	case KEY_DSA:
 	case KEY_DSA_CERT:
-		if (bn_maybe_alloc_failed(k->dsa->priv_key))
-			return SSH_ERR_ALLOC_FAIL;
 		break;
-#undef bn_maybe_alloc_failed
 	case KEY_ECDSA:
 	case KEY_ECDSA_CERT:
 		/* Cannot do anything until we know the group */
@@ -669,17 +648,31 @@ sshkey_equal_public(const struct sshkey 
 #ifdef WITH_OPENSSL
 	case KEY_RSA1:
 	case KEY_RSA_CERT:
-	case KEY_RSA:
-		return a->rsa != NULL && b->rsa != NULL &&
-		    BN_cmp(a->rsa->e, b->rsa->e) == 0 &&
-		    BN_cmp(a->rsa->n, b->rsa->n) == 0;
+	case KEY_RSA: {
+			const BIGNUM *a_e, *a_n, *b_e, *b_n;
+
+			if (a->rsa == NULL || b->rsa == NULL)
+				return 0;
+			RSA_get0_key(a->rsa, &a_n, &a_e, NULL);
+			RSA_get0_key(b->rsa, &b_n, &b_e, NULL);
+			return BN_cmp(a_e, b_e) == 0 && BN_cmp(a_n, b_n) == 0;
+		}
 	case KEY_DSA_CERT:
-	case KEY_DSA:
-		return a->dsa != NULL && b->dsa != NULL &&
-		    BN_cmp(a->dsa->p, b->dsa->p) == 0 &&
-		    BN_cmp(a->dsa->q, b->dsa->q) == 0 &&
-		    BN_cmp(a->dsa->g, b->dsa->g) == 0 &&
-		    BN_cmp(a->dsa->pub_key, b->dsa->pub_key) == 0;
+	case KEY_DSA: {
+			const BIGNUM *a_p, *a_q, *a_g, *a_pub_key;
+			const BIGNUM *b_p, *b_q, *b_g, *b_pub_key;
+
+			if (a->dsa == NULL || b->dsa == NULL)
+				return 0;
+			DSA_get0_pqg(a->dsa, &a_p, &a_q, &a_g);
+			DSA_get0_key(a->dsa, &a_pub_key, NULL);
+			DSA_get0_pqg(b->dsa, &b_p, &b_q, &b_g);
+			DSA_get0_key(b->dsa, &b_pub_key, NULL);
+			return BN_cmp(a_p, b_p) == 0 &&
+			    BN_cmp(a_q, b_q) == 0 &&
+			    BN_cmp(a_g, b_g) == 0 &&
+			    BN_cmp(a_pub_key, b_pub_key) == 0;
+		}
 # ifdef OPENSSL_HAS_ECC
 	case KEY_ECDSA_CERT:
 	case KEY_ECDSA:
@@ -754,15 +747,21 @@ to_blob_buf(const struct sshkey *key, st
 			return ret;
 		break;
 #ifdef WITH_OPENSSL
-	case KEY_DSA:
-		if (key->dsa == NULL)
-			return SSH_ERR_INVALID_ARGUMENT;
-		if ((ret = sshbuf_put_cstring(b, typename)) != 0 ||
-		    (ret = sshbuf_put_bignum2(b, key->dsa->p)) != 0 ||
-		    (ret = sshbuf_put_bignum2(b, key->dsa->q)) != 0 ||
-		    (ret = sshbuf_put_bignum2(b, key->dsa->g)) != 0 ||
-		    (ret = sshbuf_put_bignum2(b, key->dsa->pub_key)) != 0)
-			return ret;
+	case KEY_DSA: {
+			const BIGNUM *p, *q, *g, *pub_key;
+
+			if (key->dsa == NULL)
+				return SSH_ERR_INVALID_ARGUMENT;
+
+			DSA_get0_pqg(key->dsa, &p, &q, &g);
+			DSA_get0_key(key->dsa, &pub_key, NULL);
+			if ((ret = sshbuf_put_cstring(b, typename)) != 0 ||
+			    (ret = sshbuf_put_bignum2(b, p)) != 0 ||
+			    (ret = sshbuf_put_bignum2(b, q)) != 0 ||
+			    (ret = sshbuf_put_bignum2(b, g)) != 0 ||
+			    (ret = sshbuf_put_bignum2(b, pub_key)) != 0)
+				return ret;
+		}
 		break;
 # ifdef OPENSSL_HAS_ECC
 	case KEY_ECDSA:
@@ -775,13 +774,18 @@ to_blob_buf(const struct sshkey *key, st
 			return ret;
 		break;
 # endif
-	case KEY_RSA:
-		if (key->rsa == NULL)
-			return SSH_ERR_INVALID_ARGUMENT;
-		if ((ret = sshbuf_put_cstring(b, typename)) != 0 ||
-		    (ret = sshbuf_put_bignum2(b, key->rsa->e)) != 0 ||
-		    (ret = sshbuf_put_bignum2(b, key->rsa->n)) != 0)
-			return ret;
+	case KEY_RSA: {
+			const BIGNUM *e, *n;
+
+			if (key->rsa == NULL)
+				return SSH_ERR_INVALID_ARGUMENT;
+
+			RSA_get0_key(key->rsa, &n, &e, NULL);
+			if ((ret = sshbuf_put_cstring(b, typename)) != 0 ||
+			    (ret = sshbuf_put_bignum2(b, e)) != 0 ||
+			    (ret = sshbuf_put_bignum2(b, n)) != 0)
+				return ret;
+		}
 		break;
 #endif /* WITH_OPENSSL */
 	case KEY_ED25519:
@@ -887,8 +891,13 @@ sshkey_fingerprint_raw(const struct sshk
 
 	if (k->type == KEY_RSA1) {
 #ifdef WITH_OPENSSL
-		int nlen = BN_num_bytes(k->rsa->n);
-		int elen = BN_num_bytes(k->rsa->e);
+		const BIGNUM *n, *e;
+		int nlen, elen;
+
+		RSA_get0_key(k->rsa, &n, &e, NULL);
+
+		nlen = BN_num_bytes(n);
+		elen = BN_num_bytes(e);
 
 		if (nlen < 0 || elen < 0 || nlen >= INT_MAX - elen) {
 			r = SSH_ERR_INVALID_FORMAT;
@@ -899,8 +908,8 @@ sshkey_fingerprint_raw(const struct sshk
 			r = SSH_ERR_ALLOC_FAIL;
 			goto out;
 		}
-		BN_bn2bin(k->rsa->n, blob);
-		BN_bn2bin(k->rsa->e, blob + nlen);
+		BN_bn2bin(n, blob);
+		BN_bn2bin(e, blob + nlen);
 #endif /* WITH_OPENSSL */
 	} else if ((r = to_blob(k, &blob, &blob_len, 1)) != 0)
 		goto out;
@@ -1239,6 +1248,7 @@ sshkey_read(struct sshkey *ret, char **c
 	struct sshbuf *blob;
 #ifdef WITH_SSH1
 	u_long bits;
+	BIGNUM *e = NULL, *n = NULL;
 #endif /* WITH_SSH1 */
 
 	if (ret == NULL)
@@ -1255,12 +1265,21 @@ sshkey_read(struct sshkey *ret, char **c
 		    bits == 0 || bits > SSHBUF_MAX_BIGNUM * 8)
 			return SSH_ERR_INVALID_FORMAT;	/* Bad bit count... */
 		/* Get public exponent, public modulus. */
-		if ((r = read_decimal_bignum(&ep, ret->rsa->e)) < 0)
+		if ((e = BN_new()) == NULL || (n = BN_new()) == NULL) {
+			BN_free(e);
+			return SSH_ERR_ALLOC_FAIL;
+		}
+		if ((r = read_decimal_bignum(&ep, e)) < 0)
 			return r;
-		if ((r = read_decimal_bignum(&ep, ret->rsa->n)) < 0)
+		if ((r = read_decimal_bignum(&ep, n)) < 0)
 			return r;
+		if (RSA_set0_key(ret->rsa, n, e, NULL) == 0) {
+			BN_free(e);
+			BN_free(n);
+			return -1;
+		}
 		/* validate the claimed number of bits */
-		if (BN_num_bits(ret->rsa->n) != (int)bits)
+		if (BN_num_bits(n) != (int)bits)
 			return SSH_ERR_KEY_BITS_MISMATCH;
 		*cpp = ep;
 		retval = 0;
@@ -1425,19 +1444,20 @@ sshkey_format_rsa1(const struct sshkey *
 #ifdef WITH_SSH1
 	u_int bits = 0;
 	char *dec_e = NULL, *dec_n = NULL;
+	const BIGNUM *e, *n;
 
-	if (key->rsa == NULL || key->rsa->e == NULL ||
-	    key->rsa->n == NULL) {
+	RSA_get0_key(key->rsa, &n, &e, NULL);
+	if (key->rsa == NULL || e == NULL || n == NULL) {
 		r = SSH_ERR_INVALID_ARGUMENT;
 		goto out;
 	}
-	if ((dec_e = BN_bn2dec(key->rsa->e)) == NULL ||
-	    (dec_n = BN_bn2dec(key->rsa->n)) == NULL) {
+	if ((dec_e = BN_bn2dec(e)) == NULL ||
+	    (dec_n = BN_bn2dec(n)) == NULL) {
 		r = SSH_ERR_ALLOC_FAIL;
 		goto out;
 	}
 	/* size of modulus 'n' */
-	if ((bits = BN_num_bits(key->rsa->n)) <= 0) {
+	if ((bits = BN_num_bits(n)) <= 0) {
 		r = SSH_ERR_INVALID_ARGUMENT;
 		goto out;
 	}
@@ -1769,15 +1789,32 @@ sshkey_from_private(const struct sshkey 
 	switch (k->type) {
 #ifdef WITH_OPENSSL
 	case KEY_DSA:
-	case KEY_DSA_CERT:
-		if ((n = sshkey_new(k->type)) == NULL)
-			return SSH_ERR_ALLOC_FAIL;
-		if ((BN_copy(n->dsa->p, k->dsa->p) == NULL) ||
-		    (BN_copy(n->dsa->q, k->dsa->q) == NULL) ||
-		    (BN_copy(n->dsa->g, k->dsa->g) == NULL) ||
-		    (BN_copy(n->dsa->pub_key, k->dsa->pub_key) == NULL)) {
-			sshkey_free(n);
-			return SSH_ERR_ALLOC_FAIL;
+	case KEY_DSA_CERT: {
+			const BIGNUM *k_p, *k_q, *k_g, *k_pub_key;
+			BIGNUM *n_p = NULL, *n_q = NULL, *n_g = NULL, *n_pub_key = NULL;
+
+			if ((n = sshkey_new(k->type)) == NULL)
+				return SSH_ERR_ALLOC_FAIL;
+
+			DSA_get0_pqg(k->dsa, &k_p, &k_q, &k_g);
+			DSA_get0_key(k->dsa, &k_pub_key, NULL);
+
+			if (((n_p = BN_dup(k_p)) == NULL) ||
+			    ((n_q = BN_dup(k_q)) == NULL) ||
+			    ((n_g = BN_dup(k_g)) == NULL) ||
+			    (DSA_set0_pqg(n->dsa, n_p, n_q, n_g) == 0)) {
+				sshkey_free(n);
+				BN_free(n_p);
+				BN_free(n_q);
+				BN_free(n_g);
+				return SSH_ERR_ALLOC_FAIL;
+			}
+			if (((n_pub_key = BN_dup(k_pub_key)) == NULL) ||
+			    (DSA_set0_key(n->dsa, n_pub_key, NULL) == 0)) {
+				sshkey_free(n);
+				BN_free(n_pub_key);
+				return SSH_ERR_ALLOC_FAIL;
+			}
 		}
 		break;
 # ifdef OPENSSL_HAS_ECC
@@ -1800,13 +1837,22 @@ sshkey_from_private(const struct sshkey 
 # endif /* OPENSSL_HAS_ECC */
 	case KEY_RSA:
 	case KEY_RSA1:
-	case KEY_RSA_CERT:
-		if ((n = sshkey_new(k->type)) == NULL)
-			return SSH_ERR_ALLOC_FAIL;
-		if ((BN_copy(n->rsa->n, k->rsa->n) == NULL) ||
-		    (BN_copy(n->rsa->e, k->rsa->e) == NULL)) {
-			sshkey_free(n);
-			return SSH_ERR_ALLOC_FAIL;
+	case KEY_RSA_CERT: {
+			const BIGNUM *k_n, *k_e;
+			BIGNUM *n_n = NULL, *n_e = NULL;
+
+			if ((n = sshkey_new(k->type)) == NULL)
+				return SSH_ERR_ALLOC_FAIL;
+
+			RSA_get0_key(k->rsa, &k_n, &k_e, NULL);
+			if (((n_n = BN_dup(k_n)) == NULL) ||
+			    ((n_e = BN_dup(k_e)) == NULL) ||
+			    RSA_set0_key(n->rsa, n_n, n_e, NULL) == 0) {
+				sshkey_free(n);
+				BN_free(n_n);
+				BN_free(n_e);
+				return SSH_ERR_ALLOC_FAIL;
+			}
 		}
 		break;
 #endif /* WITH_OPENSSL */
@@ -2004,10 +2050,20 @@ sshkey_from_blob_internal(struct sshbuf 
 			ret = SSH_ERR_ALLOC_FAIL;
 			goto out;
 		}
-		if (sshbuf_get_bignum2(b, key->rsa->e) != 0 ||
-		    sshbuf_get_bignum2(b, key->rsa->n) != 0) {
-			ret = SSH_ERR_INVALID_FORMAT;
-			goto out;
+		{
+			BIGNUM *e, *n;
+
+			e = BN_new();
+			n = BN_new();
+			if (e == NULL || n == NULL ||
+			    sshbuf_get_bignum2(b, e) != 0 ||
+			    sshbuf_get_bignum2(b, n) != 0 ||
+			    RSA_set0_key(key->rsa, n, e, NULL) == 0) {
+				BN_free(e);
+				BN_free(n);
+				ret = SSH_ERR_ALLOC_FAIL;
+				goto out;
+			}
 		}
 #ifdef DEBUG_PK
 		RSA_print_fp(stderr, key->rsa, 8);
@@ -2025,12 +2081,34 @@ sshkey_from_blob_internal(struct sshbuf 
 			ret = SSH_ERR_ALLOC_FAIL;
 			goto out;
 		}
-		if (sshbuf_get_bignum2(b, key->dsa->p) != 0 ||
-		    sshbuf_get_bignum2(b, key->dsa->q) != 0 ||
-		    sshbuf_get_bignum2(b, key->dsa->g) != 0 ||
-		    sshbuf_get_bignum2(b, key->dsa->pub_key) != 0) {
-			ret = SSH_ERR_INVALID_FORMAT;
-			goto out;
+		{
+			BIGNUM *p, *q, *g, *pub_key;
+
+			p = BN_new();
+			q = BN_new();
+			g = BN_new();
+			pub_key = BN_new();
+
+			if (p == NULL || q == NULL || g == NULL ||
+			    pub_key == NULL ||
+			    sshbuf_get_bignum2(b, p) != 0 ||
+			    sshbuf_get_bignum2(b, q) != 0 ||
+			    sshbuf_get_bignum2(b, g) != 0 ||
+			    sshbuf_get_bignum2(b, pub_key) != 0 ||
+			    DSA_set0_pqg(key->dsa, p, q, g) == 0) {
+				BN_free(p);
+				BN_free(q);
+				BN_free(g);
+				BN_free(pub_key);
+				ret = SSH_ERR_ALLOC_FAIL;
+				goto out;
+			}
+
+			if (DSA_set0_key(key->dsa, pub_key, NULL) == 0) {
+				BN_free(pub_key);
+				ret = SSH_ERR_LIBCRYPTO_ERROR;
+				goto out;
+			}
 		}
 #ifdef DEBUG_PK
 		DSA_print_fp(stderr, key->dsa, 8);
@@ -2270,26 +2348,53 @@ sshkey_demote(const struct sshkey *k, st
 			goto fail;
 		/* FALLTHROUGH */
 	case KEY_RSA1:
-	case KEY_RSA:
-		if ((pk->rsa = RSA_new()) == NULL ||
-		    (pk->rsa->e = BN_dup(k->rsa->e)) == NULL ||
-		    (pk->rsa->n = BN_dup(k->rsa->n)) == NULL) {
-			ret = SSH_ERR_ALLOC_FAIL;
-			goto fail;
+	case KEY_RSA: {
+			const BIGNUM *k_e, *k_n;
+			BIGNUM *pk_e = NULL, *pk_n = NULL;
+
+			RSA_get0_key(k->rsa, &k_n, &k_e, NULL);
+			if ((pk->rsa = RSA_new()) == NULL ||
+			    (pk_e = BN_dup(k_e)) == NULL ||
+			    (pk_n = BN_dup(k_n)) == NULL ||
+			    RSA_set0_key(pk->rsa, pk_n, pk_e, NULL) == 0) {
+				BN_free(pk_e);
+				BN_free(pk_n);
+				ret = SSH_ERR_ALLOC_FAIL;
+				goto fail;
 			}
+		}
 		break;
 	case KEY_DSA_CERT:
 		if ((ret = sshkey_cert_copy(k, pk)) != 0)
 			goto fail;
 		/* FALLTHROUGH */
-	case KEY_DSA:
-		if ((pk->dsa = DSA_new()) == NULL ||
-		    (pk->dsa->p = BN_dup(k->dsa->p)) == NULL ||
-		    (pk->dsa->q = BN_dup(k->dsa->q)) == NULL ||
-		    (pk->dsa->g = BN_dup(k->dsa->g)) == NULL ||
-		    (pk->dsa->pub_key = BN_dup(k->dsa->pub_key)) == NULL) {
-			ret = SSH_ERR_ALLOC_FAIL;
-			goto fail;
+	case KEY_DSA: {
+			const BIGNUM *k_p, *k_q, *k_g, *k_pub_key;
+			BIGNUM *pk_p = NULL, *pk_q = NULL, *pk_g = NULL;
+			BIGNUM *pk_pub_key = NULL;
+
+			DSA_get0_pqg(k->dsa, &k_p, &k_q, &k_g);
+			DSA_get0_key(k->dsa, &k_pub_key, NULL);
+
+			if ((pk->dsa = DSA_new()) == NULL ||
+			    (pk_p = BN_dup(k_p)) == NULL ||
+			    (pk_q = BN_dup(k_q)) == NULL ||
+			    (pk_g = BN_dup(k_g)) == NULL ||
+			    (pk_pub_key = BN_dup(k_pub_key)) == NULL ||
+			    DSA_set0_pqg(pk->dsa, pk_p, pk_q, pk_g) == 0) {
+				BN_free(pk_p);
+				BN_free(pk_q);
+				BN_free(pk_g);
+				BN_free(pk_pub_key);
+				ret = SSH_ERR_ALLOC_FAIL;
+				goto fail;
+			}
+
+			if (DSA_set0_key(pk->dsa, pk_pub_key, NULL) == 0) {
+				BN_free(pk_pub_key);
+				ret = SSH_ERR_LIBCRYPTO_ERROR;
+				goto fail;
+			}
 		}
 		break;
 	case KEY_ECDSA_CERT:
@@ -2410,12 +2515,17 @@ sshkey_certify(struct sshkey *k, struct 
 	/* XXX this substantially duplicates to_blob(); refactor */
 	switch (k->type) {
 #ifdef WITH_OPENSSL
-	case KEY_DSA_CERT:
-		if ((ret = sshbuf_put_bignum2(cert, k->dsa->p)) != 0 ||
-		    (ret = sshbuf_put_bignum2(cert, k->dsa->q)) != 0 ||
-		    (ret = sshbuf_put_bignum2(cert, k->dsa->g)) != 0 ||
-		    (ret = sshbuf_put_bignum2(cert, k->dsa->pub_key)) != 0)
-			goto out;
+	case KEY_DSA_CERT: {
+			const BIGNUM *p, *q, *g, *pub_key;
+
+			DSA_get0_pqg(k->dsa, &p, &q, &g);
+			DSA_get0_key(k->dsa, &pub_key, NULL);
+			if ((ret = sshbuf_put_bignum2(cert, p)) != 0 ||
+			    (ret = sshbuf_put_bignum2(cert, q)) != 0 ||
+			    (ret = sshbuf_put_bignum2(cert, g)) != 0 ||
+			    (ret = sshbuf_put_bignum2(cert, pub_key)) != 0)
+				goto out;
+		}
 		break;
 # ifdef OPENSSL_HAS_ECC
 	case KEY_ECDSA_CERT:
@@ -2427,10 +2537,15 @@ sshkey_certify(struct sshkey *k, struct 
 			goto out;
 		break;
 # endif /* OPENSSL_HAS_ECC */
-	case KEY_RSA_CERT:
-		if ((ret = sshbuf_put_bignum2(cert, k->rsa->e)) != 0 ||
-		    (ret = sshbuf_put_bignum2(cert, k->rsa->n)) != 0)
-			goto out;
+	case KEY_RSA_CERT: {
+			const BIGNUM *e, *n;
+
+			RSA_get0_key(k->rsa, &n, &e, NULL);
+			if (e == NULL || n == NULL ||
+			    (ret = sshbuf_put_bignum2(cert, e)) != 0 ||
+			    (ret = sshbuf_put_bignum2(cert, n)) != 0)
+				goto out;
+		}
 		break;
 #endif /* WITH_OPENSSL */
 	case KEY_ED25519_CERT:
@@ -2587,43 +2702,65 @@ sshkey_private_serialize(const struct ss
 		goto out;
 	switch (key->type) {
 #ifdef WITH_OPENSSL
-	case KEY_RSA:
-		if ((r = sshbuf_put_bignum2(b, key->rsa->n)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->e)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->d)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->iqmp)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->p)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->q)) != 0)
-			goto out;
+	case KEY_RSA: {
+			const BIGNUM *n, *e, *d, *iqmp, *p, *q;
+			RSA_get0_key(key->rsa, &n, &e, &d);
+			RSA_get0_crt_params(key->rsa, NULL, NULL, &iqmp);
+			RSA_get0_factors(key->rsa, &p, &q);
+			if ((r = sshbuf_put_bignum2(b, n)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, e)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, d)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, iqmp)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, p)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, q)) != 0)
+				goto out;
+		}
 		break;
 	case KEY_RSA_CERT:
 		if (key->cert == NULL || sshbuf_len(key->cert->certblob) == 0) {
 			r = SSH_ERR_INVALID_ARGUMENT;
 			goto out;
 		}
-		if ((r = sshbuf_put_stringb(b, key->cert->certblob)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->d)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->iqmp)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->p)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->rsa->q)) != 0)
-			goto out;
+		{
+			const BIGNUM *d, *iqmp, *p, *q;
+
+			RSA_get0_key(key->rsa, NULL, NULL, &d);
+			RSA_get0_factors(key->rsa, &p, &q);
+			RSA_get0_crt_params(key->rsa, NULL, NULL, &iqmp);
+			if ((r = sshbuf_put_stringb(b, key->cert->certblob)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, d)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, iqmp)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, p)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, q)) != 0)
+				goto out;
+		}
 		break;
-	case KEY_DSA:
-		if ((r = sshbuf_put_bignum2(b, key->dsa->p)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->dsa->q)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->dsa->g)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->dsa->pub_key)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->dsa->priv_key)) != 0)
-			goto out;
+	case KEY_DSA: {
+			const BIGNUM *p, *q, *g, *pub_key, *priv_key;
+
+			DSA_get0_pqg(key->dsa, &p, &q, &g);
+			DSA_get0_key(key->dsa, &pub_key, &priv_key);
+			if ((r = sshbuf_put_bignum2(b, p)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, q)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, g)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, pub_key)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, priv_key)) != 0)
+				goto out;
+		}
 		break;
 	case KEY_DSA_CERT:
 		if (key->cert == NULL || sshbuf_len(key->cert->certblob) == 0) {
 			r = SSH_ERR_INVALID_ARGUMENT;
 			goto out;
 		}
-		if ((r = sshbuf_put_stringb(b, key->cert->certblob)) != 0 ||
-		    (r = sshbuf_put_bignum2(b, key->dsa->priv_key)) != 0)
-			goto out;
+		{
+			const BIGNUM *priv_key;
+
+			DSA_get0_key(key->dsa, NULL, &priv_key);
+			if ((r = sshbuf_put_stringb(b, key->cert->certblob)) != 0 ||
+			    (r = sshbuf_put_bignum2(b, priv_key)) != 0)
+				goto out;
+		}
 		break;
 # ifdef OPENSSL_HAS_ECC
 	case KEY_ECDSA:
@@ -2699,18 +2836,51 @@ sshkey_private_deserialize(struct sshbuf
 			r = SSH_ERR_ALLOC_FAIL;
 			goto out;
 		}
-		if ((r = sshbuf_get_bignum2(buf, k->dsa->p)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->dsa->q)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->dsa->g)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->dsa->pub_key)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->dsa->priv_key)) != 0)
-			goto out;
+		{
+			BIGNUM *p, *q, *g, *pub_key, *priv_key;
+
+			p = BN_new();
+			q = BN_new();
+			g = BN_new();
+			pub_key = BN_new();
+			priv_key = BN_new();
+			if (p == NULL || q == NULL || g == NULL ||
+			    pub_key == NULL || priv_key == NULL ||
+			    (r = sshbuf_get_bignum2(buf, p)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, q)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, g)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, pub_key)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, priv_key)) != 0 ||
+			    (r = ((DSA_set0_pqg(k->dsa, p, q, g) == 0)
+			    ? SSH_ERR_LIBCRYPTO_ERROR : 0)) != 0) {
+				BN_free(p);
+				BN_free(q);
+				BN_free(g);
+				BN_free(pub_key);
+				BN_free(priv_key);
+				goto out;
+			}
+			if (DSA_set0_key(k->dsa, pub_key, priv_key) == 0) {
+				r = SSH_ERR_LIBCRYPTO_ERROR;
+				BN_free(pub_key);
+				BN_free(priv_key);
+				goto out;
+			}
+		}
 		break;
-	case KEY_DSA_CERT:
-		if ((r = sshkey_froms(buf, &k)) != 0 ||
-		    (r = sshkey_add_private(k)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->dsa->priv_key)) != 0)
-			goto out;
+	case KEY_DSA_CERT: {
+			BIGNUM *priv_key = BN_new();
+
+			if (priv_key == NULL ||
+			    (r = sshkey_froms(buf, &k)) != 0 ||
+			    (r = sshkey_add_private(k)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, priv_key)) != 0 ||
+			    (r = ((DSA_set0_key(k->dsa, NULL, priv_key) == 0)
+			    ? SSH_ERR_LIBCRYPTO_ERROR : 0)) != 0) {
+				BN_free(priv_key);
+				goto out;
+			}
+		}
 		break;
 # ifdef OPENSSL_HAS_ECC
 	case KEY_ECDSA:
@@ -2769,24 +2939,84 @@ sshkey_private_deserialize(struct sshbuf
 			r = SSH_ERR_ALLOC_FAIL;
 			goto out;
 		}
-		if ((r = sshbuf_get_bignum2(buf, k->rsa->n)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->e)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->d)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->iqmp)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->p)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->q)) != 0 ||
-		    (r = rsa_generate_additional_parameters(k->rsa)) != 0)
-			goto out;
+		{
+			BIGNUM *n, *e, *d, *iqmp, *p, *q;
+
+			n = BN_new();
+			e = BN_new();
+			d = BN_new();
+			iqmp = BN_new();
+			p = BN_new();
+			q = BN_new();
+
+			if (n == NULL || e == NULL || d == NULL ||
+			    iqmp == NULL || p == NULL || q == NULL ||
+			    (r = sshbuf_get_bignum2(buf, n)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, e)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, d)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, iqmp)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, p)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, q)) != 0 ||
+			    (r = ((RSA_set0_key(k->rsa, n, e, d) == 0)
+			    ? SSH_ERR_LIBCRYPTO_ERROR : 0)) != 0) {
+				BN_free(n);
+				BN_free(e);
+				BN_free(d);
+				BN_free(iqmp);
+				BN_free(p);
+				BN_free(q);
+				goto out;
+			}
+			if (RSA_set0_factors(k->rsa, p, q) == 0) {
+				r = SSH_ERR_LIBCRYPTO_ERROR;
+				BN_free(iqmp);
+				BN_free(p);
+				BN_free(q);
+				goto out;
+			}
+			if ((r = rsa_generate_additional_parameters(k->rsa, iqmp)) != 0) {
+				BN_free(iqmp);
+				goto out;
+			}
+		}
 		break;
-	case KEY_RSA_CERT:
-		if ((r = sshkey_froms(buf, &k)) != 0 ||
-		    (r = sshkey_add_private(k)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->d)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->iqmp)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->p)) != 0 ||
-		    (r = sshbuf_get_bignum2(buf, k->rsa->q)) != 0 ||
-		    (r = rsa_generate_additional_parameters(k->rsa)) != 0)
-			goto out;
+	case KEY_RSA_CERT: {
+			BIGNUM *d, *iqmp, *p, *q;
+
+			/* N and E are already set so make sure we will not overwrite them */
+			d = BN_new();
+			iqmp = BN_new();
+			p = BN_new();
+			q = BN_new();
+
+			if (d == NULL || iqmp == NULL || p == NULL ||
+			    q == NULL ||
+			    (r = sshkey_froms(buf, &k)) != 0 ||
+			    (r = sshkey_add_private(k)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, d)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, iqmp)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, p)) != 0 ||
+			    (r = sshbuf_get_bignum2(buf, q)) != 0 ||
+			    (r = ((RSA_set0_key(k->rsa, NULL, NULL, d) == 0)
+			        ? SSH_ERR_LIBCRYPTO_ERROR : 0)) != 0) {
+				BN_free(d);
+				BN_free(iqmp);
+				BN_free(p);
+				BN_free(q);
+				goto out;
+			}
+			if (RSA_set0_factors(k->rsa, p, q) == 0) {
+			        r = SSH_ERR_LIBCRYPTO_ERROR;
+				BN_free(p);
+				BN_free(q);
+				goto out;
+			}
+			if (rsa_generate_additional_parameters(k->rsa, iqmp) != 0) {
+			        r = SSH_ERR_LIBCRYPTO_ERROR;
+				free(iqmp);
+				goto out;
+			}
+		}
 		break;
 #endif /* WITH_OPENSSL */
 	case KEY_ED25519:
@@ -3421,6 +3651,7 @@ sshkey_private_rsa1_to_blob(struct sshke
 	struct sshcipher_ctx *ciphercontext = NULL;
 	const struct sshcipher *cipher;
 	u_char *cp;
+	const BIGNUM *n, *e, *d, *q, *p, *iqmp;
 
 	/*
 	 * If the passphrase is empty, use SSH_CIPHER_NONE to ease converting
@@ -3447,10 +3678,13 @@ sshkey_private_rsa1_to_blob(struct sshke
 	 * format would just give known plaintext).
 	 * Note: q and p are stored in reverse order to SSL.
 	 */
-	if ((r = sshbuf_put_bignum1(buffer, key->rsa->d)) != 0 ||
-	    (r = sshbuf_put_bignum1(buffer, key->rsa->iqmp)) != 0 ||
-	    (r = sshbuf_put_bignum1(buffer, key->rsa->q)) != 0 ||
-	    (r = sshbuf_put_bignum1(buffer, key->rsa->p)) != 0)
+	RSA_get0_key(key->rsa, &n, &e, &d);
+	RSA_get0_factors(key->rsa, &p, &q);
+	RSA_get0_crt_params(key->rsa, NULL, NULL, &iqmp);
+	if ((r = sshbuf_put_bignum1(buffer, d)) != 0 ||
+	    (r = sshbuf_put_bignum1(buffer, iqmp)) != 0 ||
+	    (r = sshbuf_put_bignum1(buffer, q)) != 0 ||
+	    (r = sshbuf_put_bignum1(buffer, p)) != 0)
 		goto out;
 
 	/* Pad the part to be encrypted to a size that is a multiple of 8. */
@@ -3475,9 +3709,9 @@ sshkey_private_rsa1_to_blob(struct sshke
 		goto out;
 
 	/* Store public key.  This will be in plain text. */
-	if ((r = sshbuf_put_u32(encrypted, BN_num_bits(key->rsa->n))) != 0 ||
-	    (r = sshbuf_put_bignum1(encrypted, key->rsa->n)) != 0 ||
-	    (r = sshbuf_put_bignum1(encrypted, key->rsa->e)) != 0 ||
+	if ((r = sshbuf_put_u32(encrypted, BN_num_bits(n))) != 0 ||
+	    (r = sshbuf_put_bignum1(encrypted, n)) != 0 ||
+	    (r = sshbuf_put_bignum1(encrypted, e)) != 0 ||
 	    (r = sshbuf_put_cstring(encrypted, comment)) != 0)
 		goto out;
 
@@ -3604,6 +3838,7 @@ sshkey_parse_public_rsa1_fileblob(struct
 	int r;
 	struct sshkey *pub = NULL;
 	struct sshbuf *copy = NULL;
+	BIGNUM *n = NULL, *e = NULL;
 
 	if (keyp != NULL)
 		*keyp = NULL;
@@ -3633,10 +3868,16 @@ sshkey_parse_public_rsa1_fileblob(struct
 		goto out;
 
 	/* Read the public key from the buffer. */
-	if ((pub = sshkey_new(KEY_RSA1)) == NULL ||
-	    (r = sshbuf_get_bignum1(copy, pub->rsa->n)) != 0 ||
-	    (r = sshbuf_get_bignum1(copy, pub->rsa->e)) != 0)
+	if ((n = BN_new()) == NULL ||
+	    (e = BN_new()) == NULL ||
+	    (pub = sshkey_new(KEY_RSA1)) == NULL ||
+	    (r = sshbuf_get_bignum1(copy, n)) != 0 ||
+	    (r = sshbuf_get_bignum1(copy, e)) != 0 ||
+	    RSA_set0_key(pub->rsa, n, e, NULL) == 0) {
+		BN_free(n);
+		BN_free(e);
 		goto out;
+	}
 
 	/* Finally, the comment */
 	if ((r = sshbuf_get_string(copy, (u_char**)commentp, NULL)) != 0)
@@ -3668,6 +3909,8 @@ sshkey_parse_private_rsa1(struct sshbuf 
 	struct sshcipher_ctx *ciphercontext = NULL;
 	const struct sshcipher *cipher;
 	struct sshkey *prv = NULL;
+	BIGNUM *n = NULL, *e = NULL, *d = NULL, *q = NULL, *p = NULL,
+	    *iqmp = NULL;
 
 	if (keyp != NULL)
 		*keyp = NULL;
@@ -3703,11 +3946,17 @@ sshkey_parse_private_rsa1(struct sshbuf 
 		goto out;
 
 	/* Read the public key and comment from the buffer. */
-	if ((r = sshbuf_get_u32(copy, NULL)) != 0 ||	/* key bits */
-	    (r = sshbuf_get_bignum1(copy, prv->rsa->n)) != 0 ||
-	    (r = sshbuf_get_bignum1(copy, prv->rsa->e)) != 0 ||
-	    (r = sshbuf_get_cstring(copy, &comment, NULL)) != 0)
+	if ((n = BN_new()) == NULL ||
+	    (e = BN_new()) == NULL ||
+	    (r = sshbuf_get_u32(copy, NULL)) != 0 ||	/* key bits */
+	    (r = sshbuf_get_bignum1(copy, n)) != 0 ||
+	    (r = sshbuf_get_bignum1(copy, e)) != 0 ||
+	    (r = sshbuf_get_cstring(copy, &comment, NULL)) != 0 ||
+	    RSA_set0_key(prv->rsa, n, e, NULL) == 0) {
+		BN_free(n);
+		BN_free(e);
 		goto out;
+	}
 
 	/* Check that it is a supported cipher. */
 	cipher = cipher_by_number(cipher_type);
@@ -3736,14 +3985,31 @@ sshkey_parse_private_rsa1(struct sshbuf 
 	}
 
 	/* Read the rest of the private key. */
-	if ((r = sshbuf_get_bignum1(decrypted, prv->rsa->d)) != 0 ||
-	    (r = sshbuf_get_bignum1(decrypted, prv->rsa->iqmp)) != 0 ||
-	    (r = sshbuf_get_bignum1(decrypted, prv->rsa->q)) != 0 ||
-	    (r = sshbuf_get_bignum1(decrypted, prv->rsa->p)) != 0)
+	if ((d = BN_new()) == NULL ||
+	    (p = BN_new()) == NULL ||
+	    (q = BN_new()) == NULL ||
+	    (iqmp = BN_new()) == NULL ||
+	    (r = sshbuf_get_bignum1(decrypted, d)) != 0 ||
+	    (r = sshbuf_get_bignum1(decrypted, iqmp)) != 0 ||
+	    (r = sshbuf_get_bignum1(decrypted, q)) != 0 ||
+	    (r = sshbuf_get_bignum1(decrypted, p)) != 0 ||
+	    (RSA_set0_key(prv->rsa, NULL, NULL, d) == 0)) {
+		BN_free(d);
+		BN_free(p);
+		BN_free(q);
+		BN_free(iqmp);
+		goto out;
+	}
+	if (RSA_set0_factors(prv->rsa, p, q) == 0) {
+		BN_free(p);
+		BN_free(q);
+		BN_free(iqmp);
 		goto out;
+	}
 
 	/* calculate p-1 and q-1 */
-	if ((r = rsa_generate_additional_parameters(prv->rsa)) != 0)
+	if ((r = rsa_generate_additional_parameters(prv->rsa, iqmp)) != 0)
+		BN_free(iqmp);
 		goto out;
 
 	/* enable blinding */
@@ -3817,7 +4083,9 @@ sshkey_parse_private_pem_fileblob(struct
 			case EVP_R_BAD_DECRYPT:
 				r = SSH_ERR_KEY_WRONG_PASSPHRASE;
 				goto out;
+#ifdef EVP_R_BN_DECODE_ERROR
 			case EVP_R_BN_DECODE_ERROR:
+#endif
 			case EVP_R_DECODE_ERROR:
 #ifdef EVP_R_PRIVATE_KEY_DECODE_ERROR
 			case EVP_R_PRIVATE_KEY_DECODE_ERROR:
@@ -3835,7 +4103,7 @@ sshkey_parse_private_pem_fileblob(struct
 		r = SSH_ERR_LIBCRYPTO_ERROR;
 		goto out;
 	}
-	if (pk->type == EVP_PKEY_RSA &&
+	if (EVP_PKEY_id(pk) == EVP_PKEY_RSA &&
 	    (type == KEY_UNSPEC || type == KEY_RSA)) {
 		if ((prv = sshkey_new(KEY_UNSPEC)) == NULL) {
 			r = SSH_ERR_ALLOC_FAIL;
@@ -3850,7 +4118,7 @@ sshkey_parse_private_pem_fileblob(struct
 			r = SSH_ERR_LIBCRYPTO_ERROR;
 			goto out;
 		}
-	} else if (pk->type == EVP_PKEY_DSA &&
+	} else if (EVP_PKEY_id(pk) == EVP_PKEY_DSA &&
 	    (type == KEY_UNSPEC || type == KEY_DSA)) {
 		if ((prv = sshkey_new(KEY_UNSPEC)) == NULL) {
 			r = SSH_ERR_ALLOC_FAIL;
@@ -3862,7 +4130,7 @@ sshkey_parse_private_pem_fileblob(struct
 		DSA_print_fp(stderr, prv->dsa, 8);
 #endif
 #ifdef OPENSSL_HAS_ECC
-	} else if (pk->type == EVP_PKEY_EC &&
+	} else if (EVP_PKEY_id(pk) == EVP_PKEY_EC &&
 	    (type == KEY_UNSPEC || type == KEY_ECDSA)) {
 		if ((prv = sshkey_new(KEY_UNSPEC)) == NULL) {
 			r = SSH_ERR_ALLOC_FAIL;
