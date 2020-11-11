$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- authfd.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ authfd.c
@@ -207,15 +207,22 @@ deserialise_identity1(struct sshbuf *ids
 	int r, keybits;
 	u_int32_t bits;
 	char *comment = NULL;
+	BIGNUM *e = NULL, *n = NULL;
 
 	if ((key = sshkey_new(KEY_RSA1)) == NULL)
 		return SSH_ERR_ALLOC_FAIL;
-	if ((r = sshbuf_get_u32(ids, &bits)) != 0 ||
-	    (r = sshbuf_get_bignum1(ids, key->rsa->e)) != 0 ||
-	    (r = sshbuf_get_bignum1(ids, key->rsa->n)) != 0 ||
-	    (r = sshbuf_get_cstring(ids, &comment, NULL)) != 0)
+	if ((e = BN_new()) == NULL ||
+	    (n = BN_new()) == NULL ||
+	    (r = sshbuf_get_u32(ids, &bits)) != 0 ||
+	    (r = sshbuf_get_bignum1(ids, e)) != 0 ||
+	    (r = sshbuf_get_bignum1(ids, n)) != 0 ||
+	    (r = sshbuf_get_cstring(ids, &comment, NULL)) != 0 ||
+	    (RSA_set0_key(key->rsa, n, e, NULL) == 0)) {
+		BN_free(n);
+		BN_free(e);
 		goto out;
-	keybits = BN_num_bits(key->rsa->n);
+	}
+	keybits = BN_num_bits(n);
 	/* XXX previously we just warned here. I think we should be strict */
 	if (keybits < 0 || bits != (u_int)keybits) {
 		r = SSH_ERR_KEY_BITS_MISMATCH;
@@ -393,15 +400,17 @@ ssh_decrypt_challenge(int sock, struct s
 	struct sshbuf *msg;
 	int r;
 	u_char type;
+	const BIGNUM *e, *n;
 
 	if (key->type != KEY_RSA1)
 		return SSH_ERR_INVALID_ARGUMENT;
 	if ((msg = sshbuf_new()) == NULL)
 		return SSH_ERR_ALLOC_FAIL;
+	RSA_get0_key(key->rsa, &n, &e, NULL);
 	if ((r = sshbuf_put_u8(msg, SSH_AGENTC_RSA_CHALLENGE)) != 0 ||
-	    (r = sshbuf_put_u32(msg, BN_num_bits(key->rsa->n))) != 0 ||
-	    (r = sshbuf_put_bignum1(msg, key->rsa->e)) != 0 ||
-	    (r = sshbuf_put_bignum1(msg, key->rsa->n)) != 0 ||
+	    (r = sshbuf_put_u32(msg, BN_num_bits(n))) != 0 ||
+	    (r = sshbuf_put_bignum1(msg, e)) != 0 ||
+	    (r = sshbuf_put_bignum1(msg, n)) != 0 ||
 	    (r = sshbuf_put_bignum1(msg, challenge)) != 0 ||
 	    (r = sshbuf_put(msg, session_id, 16)) != 0 ||
 	    (r = sshbuf_put_u32(msg, 1)) != 0) /* Response type for proto 1.1 */
@@ -499,15 +508,19 @@ static int
 ssh_encode_identity_rsa1(struct sshbuf *b, RSA *key, const char *comment)
 {
 	int r;
+	const BIGNUM *n, *e, *d, *q, *p, *iqmp;
 
+	RSA_get0_key(key, &n, &e, &d);
+	RSA_get0_factors(key, &p, &q);
+	RSA_get0_crt_params(key, NULL, NULL, &iqmp);
 	/* To keep within the protocol: p < q for ssh. in SSL p > q */
-	if ((r = sshbuf_put_u32(b, BN_num_bits(key->n))) != 0 ||
-	    (r = sshbuf_put_bignum1(b, key->n)) != 0 ||
-	    (r = sshbuf_put_bignum1(b, key->e)) != 0 ||
-	    (r = sshbuf_put_bignum1(b, key->d)) != 0 ||
-	    (r = sshbuf_put_bignum1(b, key->iqmp)) != 0 ||
-	    (r = sshbuf_put_bignum1(b, key->q)) != 0 ||
-	    (r = sshbuf_put_bignum1(b, key->p)) != 0 ||
+	if ((r = sshbuf_put_u32(b, BN_num_bits(n))) != 0 ||
+	    (r = sshbuf_put_bignum1(b, n)) != 0 ||
+	    (r = sshbuf_put_bignum1(b, e)) != 0 ||
+	    (r = sshbuf_put_bignum1(b, d)) != 0 ||
+	    (r = sshbuf_put_bignum1(b, iqmp)) != 0 ||
+	    (r = sshbuf_put_bignum1(b, q)) != 0 ||
+	    (r = sshbuf_put_bignum1(b, p)) != 0 ||
 	    (r = sshbuf_put_cstring(b, comment)) != 0)
 		return r;
 	return 0;
@@ -622,11 +635,13 @@ ssh_remove_identity(int sock, struct ssh
 
 #ifdef WITH_SSH1
 	if (key->type == KEY_RSA1) {
+		const BIGNUM *e, *n;
+		RSA_get0_key(key->rsa, &n, &e, NULL);
 		if ((r = sshbuf_put_u8(msg,
 		    SSH_AGENTC_REMOVE_RSA_IDENTITY)) != 0 ||
-		    (r = sshbuf_put_u32(msg, BN_num_bits(key->rsa->n))) != 0 ||
-		    (r = sshbuf_put_bignum1(msg, key->rsa->e)) != 0 ||
-		    (r = sshbuf_put_bignum1(msg, key->rsa->n)) != 0)
+		    (r = sshbuf_put_u32(msg, BN_num_bits(n))) != 0 ||
+		    (r = sshbuf_put_bignum1(msg, e)) != 0 ||
+		    (r = sshbuf_put_bignum1(msg, n)) != 0)
 			goto out;
 	} else
 #endif
