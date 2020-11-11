$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-keyscan.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ ssh-keyscan.c
@@ -195,6 +195,7 @@ keygrab_ssh1(con *c)
 	static struct sshbuf *msg;
 	int r;
 	u_char type;
+	BIGNUM *n = NULL, *e = NULL;
 
 	if (rsa == NULL) {
 		if ((rsa = sshkey_new(KEY_RSA1)) == NULL) {
@@ -213,16 +214,20 @@ keygrab_ssh1(con *c)
 		sshbuf_reset(msg);
 		return NULL;
 	}
-	if ((r = sshbuf_consume(msg, 8)) != 0 || /* cookie */
+	if ((n = BN_new()) == NULL || (e = BN_new()) == NULL || 
+	    (r = sshbuf_consume(msg, 8)) != 0 || /* cookie */
 	    /* server key */
 	    (r = sshbuf_get_u32(msg, NULL)) != 0 ||
 	    (r = sshbuf_get_bignum1(msg, NULL)) != 0 ||
 	    (r = sshbuf_get_bignum1(msg, NULL)) != 0 ||
 	    /* host key */
 	    (r = sshbuf_get_u32(msg, NULL)) != 0 ||
-	    (r = sshbuf_get_bignum1(msg, rsa->rsa->e)) != 0 ||
-	    (r = sshbuf_get_bignum1(msg, rsa->rsa->n)) != 0) {
+	    (r = sshbuf_get_bignum1(msg, e)) != 0 ||
+	    (r = sshbuf_get_bignum1(msg, n)) != 0 ||
+	    RSA_set0_key(rsa->rsa, n, e, NULL) == 0) {
  buf_err:
+		BN_free(n);
+		BN_free(e);
 		error("%s: buffer error: %s", __func__, ssh_err(r));
 		sshbuf_reset(msg);
 		return NULL;
