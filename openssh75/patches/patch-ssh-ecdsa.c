$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-ecdsa.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ ssh-ecdsa.c
@@ -54,6 +54,7 @@ ssh_ecdsa_sign(const struct sshkey *key,
 	size_t len, dlen;
 	struct sshbuf *b = NULL, *bb = NULL;
 	int ret = SSH_ERR_INTERNAL_ERROR;
+	const BIGNUM *r, *s;
 
 	if (lenp != NULL)
 		*lenp = 0;
@@ -80,8 +81,9 @@ ssh_ecdsa_sign(const struct sshkey *key,
 		ret = SSH_ERR_ALLOC_FAIL;
 		goto out;
 	}
-	if ((ret = sshbuf_put_bignum2(bb, sig->r)) != 0 ||
-	    (ret = sshbuf_put_bignum2(bb, sig->s)) != 0)
+	ECDSA_SIG_get0(sig, &r, &s);
+	if ((ret = sshbuf_put_bignum2(bb, r)) != 0 ||
+	    (ret = sshbuf_put_bignum2(bb, s)) != 0)
 		goto out;
 	if ((ret = sshbuf_put_cstring(b, sshkey_ssh_name_plain(key))) != 0 ||
 	    (ret = sshbuf_put_stringb(b, bb)) != 0)
@@ -119,6 +121,7 @@ ssh_ecdsa_verify(const struct sshkey *ke
 	int ret = SSH_ERR_INTERNAL_ERROR;
 	struct sshbuf *b = NULL, *sigbuf = NULL;
 	char *ktype = NULL;
+	BIGNUM *r = NULL, *s = NULL;
 
 	if (key == NULL || key->ecdsa == NULL ||
 	    sshkey_type_plain(key->type) != KEY_ECDSA ||
@@ -147,15 +150,23 @@ ssh_ecdsa_verify(const struct sshkey *ke
 	}
 
 	/* parse signature */
-	if ((sig = ECDSA_SIG_new()) == NULL) {
+	if ((sig = ECDSA_SIG_new()) == NULL ||
+	    (r = BN_new()) == NULL ||
+	    (s = BN_new()) == NULL) {
 		ret = SSH_ERR_ALLOC_FAIL;
 		goto out;
 	}
-	if (sshbuf_get_bignum2(sigbuf, sig->r) != 0 ||
-	    sshbuf_get_bignum2(sigbuf, sig->s) != 0) {
+	if (sshbuf_get_bignum2(sigbuf, r) != 0 ||
+	    sshbuf_get_bignum2(sigbuf, s) != 0) {
 		ret = SSH_ERR_INVALID_FORMAT;
 		goto out;
 	}
+	if (ECDSA_SIG_set0(sig, r, s) == 0) {
+		ret = SSH_ERR_LIBCRYPTO_ERROR;
+		goto out;
+	}
+	r = NULL;
+	s = NULL;
 	if (sshbuf_len(sigbuf) != 0) {
 		ret = SSH_ERR_UNEXPECTED_TRAILING_DATA;
 		goto out;
@@ -180,8 +191,9 @@ ssh_ecdsa_verify(const struct sshkey *ke
 	explicit_bzero(digest, sizeof(digest));
 	sshbuf_free(sigbuf);
 	sshbuf_free(b);
-	if (sig != NULL)
-		ECDSA_SIG_free(sig);
+	BN_free(r);
+	BN_free(s);
+	ECDSA_SIG_free(sig);
 	free(ktype);
 	return ret;
 }
