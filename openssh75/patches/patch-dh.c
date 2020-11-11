$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- dh.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ dh.c
@@ -212,14 +212,15 @@ choose_dh(int min, int wantbits, int max
 /* diffie-hellman-groupN-sha1 */
 
 int
-dh_pub_is_valid(DH *dh, BIGNUM *dh_pub)
+dh_pub_is_valid(const DH *dh, const BIGNUM *dh_pub)
 {
 	int i;
 	int n = BN_num_bits(dh_pub);
 	int bits_set = 0;
 	BIGNUM *tmp;
+	const BIGNUM *p;
 
-	if (dh_pub->neg) {
+	if (BN_is_negative(dh_pub)) {
 		logit("invalid public DH value: negative");
 		return 0;
 	}
@@ -232,7 +233,8 @@ dh_pub_is_valid(DH *dh, BIGNUM *dh_pub)
 		error("%s: BN_new failed", __func__);
 		return 0;
 	}
-	if (!BN_sub(tmp, dh->p, BN_value_one()) ||
+	DH_get0_pqg(dh, &p, NULL, NULL);
+	if (!BN_sub(tmp, p, BN_value_one()) ||
 	    BN_cmp(dh_pub, tmp) != -1) {		/* pub_exp > p-2 */
 		BN_clear_free(tmp);
 		logit("invalid public DH value: >= p-1");
@@ -243,14 +245,14 @@ dh_pub_is_valid(DH *dh, BIGNUM *dh_pub)
 	for (i = 0; i <= n; i++)
 		if (BN_is_bit_set(dh_pub, i))
 			bits_set++;
-	debug2("bits set: %d/%d", bits_set, BN_num_bits(dh->p));
+	debug2("bits set: %d/%d", bits_set, BN_num_bits(p));
 
 	/*
 	 * if g==2 and bits_set==1 then computing log_g(dh_pub) is trivial
 	 */
 	if (bits_set < 4) {
 		logit("invalid public DH value (%d/%d)",
-		   bits_set, BN_num_bits(dh->p));
+		   bits_set, BN_num_bits(p));
 		return 0;
 	}
 	return 1;
@@ -260,9 +262,11 @@ int
 dh_gen_key(DH *dh, int need)
 {
 	int pbits;
+	const BIGNUM *p, *pub_key;
 
-	if (need < 0 || dh->p == NULL ||
-	    (pbits = BN_num_bits(dh->p)) <= 0 ||
+	DH_get0_pqg(dh, &p, NULL, NULL);
+	if (need < 0 || p == NULL ||
+	    (pbits = BN_num_bits(p)) <= 0 ||
 	    need > INT_MAX / 2 || 2 * need > pbits)
 		return SSH_ERR_INVALID_ARGUMENT;
 	if (need < 256)
@@ -271,10 +275,11 @@ dh_gen_key(DH *dh, int need)
 	 * Pollard Rho, Big step/Little Step attacks are O(sqrt(n)),
 	 * so double requested need here.
 	 */
-	dh->length = MINIMUM(need * 2, pbits - 1);
-	if (DH_generate_key(dh) == 0 ||
-	    !dh_pub_is_valid(dh, dh->pub_key)) {
-		BN_clear_free(dh->priv_key);
+	DH_set_length(dh, MINIMUM(need * 2, pbits - 1));
+	if (DH_generate_key(dh) == 0)
+		return SSH_ERR_LIBCRYPTO_ERROR;
+	DH_get0_key(dh, &pub_key, NULL);
+	if (!dh_pub_is_valid(dh, pub_key)) {
 		return SSH_ERR_LIBCRYPTO_ERROR;
 	}
 	return 0;
@@ -284,15 +289,22 @@ DH *
 dh_new_group_asc(const char *gen, const char *modulus)
 {
 	DH *dh;
+	BIGNUM *p, *g;
 
-	if ((dh = DH_new()) == NULL)
-		return NULL;
-	if (BN_hex2bn(&dh->p, modulus) == 0 ||
-	    BN_hex2bn(&dh->g, gen) == 0) {
-		DH_free(dh);
-		return NULL;
-	}
+	if ((dh = DH_new()) == NULL ||
+	    (p = BN_new()) == NULL ||
+	    (g = BN_new()) == NULL)
+		goto err;
+	if (BN_hex2bn(&p, modulus) == 0 ||
+	    BN_hex2bn(&g, gen) == 0 ||
+	    DH_set0_pqg(dh, p, NULL, g) == 0)
+		goto err;
 	return (dh);
+err:
+	DH_free(dh);
+	BN_free(p);
+	BN_free(g);
+	return NULL;
 }
 
 /*
@@ -307,8 +319,7 @@ dh_new_group(BIGNUM *gen, BIGNUM *modulu
 
 	if ((dh = DH_new()) == NULL)
 		return NULL;
-	dh->p = modulus;
-	dh->g = gen;
+	DH_set0_pqg(dh, modulus, NULL, gen);
 
 	return (dh);
 }
