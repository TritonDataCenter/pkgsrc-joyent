$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- rsa.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ rsa.c
@@ -76,11 +76,14 @@ rsa_public_encrypt(BIGNUM *out, BIGNUM *
 {
 	u_char *inbuf = NULL, *outbuf = NULL;
 	int len, ilen, olen, r = SSH_ERR_INTERNAL_ERROR;
+	const BIGNUM *e, *n;
 
-	if (BN_num_bits(key->e) < 2 || !BN_is_odd(key->e))
+	RSA_get0_key(key, &n, &e, NULL);
+
+	if (BN_num_bits(e) < 2 || !BN_is_odd(e))
 		return SSH_ERR_INVALID_ARGUMENT;
 
-	olen = BN_num_bytes(key->n);
+	olen = BN_num_bytes(n);
 	if ((outbuf = malloc(olen)) == NULL) {
 		r = SSH_ERR_ALLOC_FAIL;
 		goto out;
@@ -122,8 +125,11 @@ rsa_private_decrypt(BIGNUM *out, BIGNUM 
 {
 	u_char *inbuf = NULL, *outbuf = NULL;
 	int len, ilen, olen, r = SSH_ERR_INTERNAL_ERROR;
+	const BIGNUM *n;
+
+	RSA_get0_key(key, &n, NULL, NULL);
 
-	olen = BN_num_bytes(key->n);
+	olen = BN_num_bytes(n);
 	if ((outbuf = malloc(olen)) == NULL) {
 		r = SSH_ERR_ALLOC_FAIL;
 		goto out;
@@ -157,31 +163,42 @@ rsa_private_decrypt(BIGNUM *out, BIGNUM 
 	return r;
 }
 
-/* calculate p-1 and q-1 */
+/* calculate d mod p-1 and d mod q-1 */
 int
-rsa_generate_additional_parameters(RSA *rsa)
+rsa_generate_additional_parameters(RSA *rsa, BIGNUM *iqmp)
 {
 	BIGNUM *aux = NULL;
 	BN_CTX *ctx = NULL;
 	int r;
+	const BIGNUM *p, *q, *d;
+	BIGNUM *dmp1 = NULL, *dmq1 = NULL;
+
+	RSA_get0_factors(rsa, &p, &q);
+	RSA_get0_key(rsa, NULL, NULL, &d);
 
-	if ((ctx = BN_CTX_new()) == NULL)
-		return SSH_ERR_ALLOC_FAIL;
-	if ((aux = BN_new()) == NULL) {
+	if ((ctx = BN_CTX_new()) == NULL ||
+	    (aux = BN_new()) == NULL ||
+	    (dmp1 = BN_new()) == NULL ||
+	    (dmq1 = BN_new()) == NULL) {
 		r = SSH_ERR_ALLOC_FAIL;
 		goto out;
 	}
 
-	if ((BN_sub(aux, rsa->q, BN_value_one()) == 0) ||
-	    (BN_mod(rsa->dmq1, rsa->d, aux, ctx) == 0) ||
-	    (BN_sub(aux, rsa->p, BN_value_one()) == 0) ||
-	    (BN_mod(rsa->dmp1, rsa->d, aux, ctx) == 0)) {
+	if ((BN_sub(aux, q, BN_value_one()) == 0) ||
+	    (BN_mod(dmq1, d, aux, ctx) == 0) ||
+	    (BN_sub(aux, p, BN_value_one()) == 0) ||
+	    (BN_mod(dmp1, d, aux, ctx) == 0) ||
+	    (RSA_set0_crt_params(rsa, dmp1, dmq1, iqmp) == 0)) {
 		r = SSH_ERR_LIBCRYPTO_ERROR;
 		goto out;
 	}
+	dmp1 = NULL;
+	dmq1 = NULL;
 	r = 0;
  out:
 	BN_clear_free(aux);
+	BN_clear_free(dmp1);
+	BN_clear_free(dmq1);
 	BN_CTX_free(ctx);
 	return r;
 }
