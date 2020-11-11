$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-agent.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ ssh-agent.c
@@ -258,12 +258,12 @@ process_request_identities(SocketEntry *
 	TAILQ_FOREACH(id, &tab->idlist, next) {
 		if (id->key->type == KEY_RSA1) {
 #ifdef WITH_SSH1
+			const BIGNUM *r_n, *r_e;
+			RSA_get0_key(id->key->rsa, &r_n, &r_e, NULL);
 			if ((r = sshbuf_put_u32(msg,
-			    BN_num_bits(id->key->rsa->n))) != 0 ||
-			    (r = sshbuf_put_bignum1(msg,
-			    id->key->rsa->e)) != 0 ||
-			    (r = sshbuf_put_bignum1(msg,
-			    id->key->rsa->n)) != 0)
+			    BN_num_bits(r_n))) != 0 ||
+			    (r = sshbuf_put_bignum1(msg, r_e)) != 0 ||
+			    (r = sshbuf_put_bignum1(msg, r_n)) != 0)
 				fatal("%s: buffer error: %s",
 				    __func__, ssh_err(r));
 #endif
@@ -302,6 +302,7 @@ process_authentication_challenge1(Socket
 	struct sshbuf *msg;
 	struct ssh_digest_ctx *md;
 	struct sshkey *key;
+	BIGNUM *r_n = NULL, *r_e = NULL;
 
 	if ((msg = sshbuf_new()) == NULL)
 		fatal("%s: sshbuf_new failed", __func__);
@@ -310,11 +311,16 @@ process_authentication_challenge1(Socket
 	if ((challenge = BN_new()) == NULL)
 		fatal("%s: BN_new failed", __func__);
 
-	if ((r = sshbuf_get_u32(e->request, NULL)) != 0 || /* ignored */
-	    (r = sshbuf_get_bignum1(e->request, key->rsa->e)) != 0 ||
-	    (r = sshbuf_get_bignum1(e->request, key->rsa->n)) != 0 ||
-	    (r = sshbuf_get_bignum1(e->request, challenge)))
+	if ((r_n = BN_new()) == NULL || (r_e = BN_new()) == NULL ||
+	    (r = sshbuf_get_u32(e->request, NULL)) != 0 || /* ignored */
+	    (r = sshbuf_get_bignum1(e->request, r_e)) != 0 ||
+	    (r = sshbuf_get_bignum1(e->request, r_n)) != 0 ||
+	    (r = sshbuf_get_bignum1(e->request, challenge)) ||
+	    RSA_set0_key(key->rsa, r_n, r_e, NULL) == 0) {
+		BN_free(r_n);
+		BN_free(r_e);
 		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+	}
 
 	/* Only protocol 1.1 is supported */
 	if (sshbuf_len(e->request) == 0)
@@ -450,6 +456,7 @@ process_remove_identity(SocketEntry *e, 
 	u_char *blob;
 #ifdef WITH_SSH1
 	u_int bits;
+	BIGNUM *r_n = NULL, *r_e = NULL;
 #endif /* WITH_SSH1 */
 
 	switch (version) {
@@ -459,10 +466,15 @@ process_remove_identity(SocketEntry *e, 
 			error("%s: sshkey_new failed", __func__);
 			return;
 		}
-		if ((r = sshbuf_get_u32(e->request, &bits)) != 0 ||
-		    (r = sshbuf_get_bignum1(e->request, key->rsa->e)) != 0 ||
-		    (r = sshbuf_get_bignum1(e->request, key->rsa->n)) != 0)
+		if ((r_n = BN_new()) == NULL || (r_e = BN_new()) == NULL ||
+		    (r = sshbuf_get_u32(e->request, &bits)) != 0 ||
+		    (r = sshbuf_get_bignum1(e->request, r_e)) != 0 ||
+		    (r = sshbuf_get_bignum1(e->request, r_n)) != 0 ||
+		    RSA_set0_key(key->rsa, r_n, r_e, NULL) == 0) {
+			BN_free(r_n);
+			BN_free(r_e);
 			fatal("%s: buffer error: %s", __func__, ssh_err(r));
+		}
 
 		if (bits != sshkey_size(key))
 			logit("Warning: identity keysize mismatch: "
@@ -565,23 +577,46 @@ agent_decode_rsa1(struct sshbuf *m, stru
 {
 	struct sshkey *k = NULL;
 	int r = SSH_ERR_INTERNAL_ERROR;
+	BIGNUM *n = NULL, *e = NULL, *d = NULL,
+	    *iqmp = NULL, *q = NULL, *p = NULL;
 
 	*kp = NULL;
 	if ((k = sshkey_new_private(KEY_RSA1)) == NULL)
 		return SSH_ERR_ALLOC_FAIL;
 
-	if ((r = sshbuf_get_u32(m, NULL)) != 0 ||		/* ignored */
-	    (r = sshbuf_get_bignum1(m, k->rsa->n)) != 0 ||
-	    (r = sshbuf_get_bignum1(m, k->rsa->e)) != 0 ||
-	    (r = sshbuf_get_bignum1(m, k->rsa->d)) != 0 ||
-	    (r = sshbuf_get_bignum1(m, k->rsa->iqmp)) != 0 ||
+	if ((n = BN_new()) == NULL || (e = BN_new()) == NULL ||
+	    (d = BN_new()) == NULL || (iqmp = BN_new()) == NULL ||
+	    (q = BN_new()) == NULL || (p = BN_new()) == NULL ||
+	    (r = sshbuf_get_u32(m, NULL)) != 0 ||		/* ignored */
+	    (r = sshbuf_get_bignum1(m, n)) != 0 ||
+	    (r = sshbuf_get_bignum1(m, e)) != 0 ||
+	    (r = sshbuf_get_bignum1(m, d)) != 0 ||
+	    (r = sshbuf_get_bignum1(m, iqmp)) != 0 ||
 	    /* SSH1 and SSL have p and q swapped */
-	    (r = sshbuf_get_bignum1(m, k->rsa->q)) != 0 ||	/* p */
-	    (r = sshbuf_get_bignum1(m, k->rsa->p)) != 0) 	/* q */
+	    (r = sshbuf_get_bignum1(m, q)) != 0 ||	/* p */
+	    (r = sshbuf_get_bignum1(m, p)) != 0 || 	/* q */
+	    RSA_set0_key(k->rsa, n, e, d) == 0) {
+		BN_free(n);
+		BN_free(e);
+		BN_free(d);
+		BN_free(p);
+		BN_free(q);
+		BN_free(iqmp);
+		goto out;
+	}
+	if (RSA_set0_factors(k->rsa, p, q) == 0) {
+		BN_free(p);
+		BN_free(q);
+		BN_free(iqmp);
 		goto out;
+	}
+	if (RSA_set0_crt_params(k->rsa, NULL, NULL, iqmp) == 0) {
+		BN_free(iqmp);
+		goto out;
+	}
 
 	/* Generate additional parameters */
-	if ((r = rsa_generate_additional_parameters(k->rsa)) != 0)
+	if ((r = rsa_generate_additional_parameters(k->rsa, NULL)) != 0)
 		goto out;
 	/* enable blinding */
 	if (RSA_blinding_on(k->rsa, NULL) != 1) {
