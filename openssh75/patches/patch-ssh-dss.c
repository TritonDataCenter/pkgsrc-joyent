$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-dss.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ ssh-dss.c
@@ -55,6 +55,7 @@ ssh_dss_sign(const struct sshkey *key, u
 	size_t rlen, slen, len, dlen = ssh_digest_bytes(SSH_DIGEST_SHA1);
 	struct sshbuf *b = NULL;
 	int ret = SSH_ERR_INVALID_ARGUMENT;
+	const BIGNUM *r, *s;
 
 	if (lenp != NULL)
 		*lenp = 0;
@@ -76,15 +77,16 @@ ssh_dss_sign(const struct sshkey *key, u
 		goto out;
 	}
 
-	rlen = BN_num_bytes(sig->r);
-	slen = BN_num_bytes(sig->s);
+	DSA_SIG_get0(sig, &r, &s);
+	rlen = BN_num_bytes(r);
+	slen = BN_num_bytes(s);
 	if (rlen > INTBLOB_LEN || slen > INTBLOB_LEN) {
 		ret = SSH_ERR_INTERNAL_ERROR;
 		goto out;
 	}
 	explicit_bzero(sigblob, SIGBLOB_LEN);
-	BN_bn2bin(sig->r, sigblob + SIGBLOB_LEN - INTBLOB_LEN - rlen);
-	BN_bn2bin(sig->s, sigblob + SIGBLOB_LEN - slen);
+	BN_bn2bin(r, sigblob + SIGBLOB_LEN - INTBLOB_LEN - rlen);
+	BN_bn2bin(s, sigblob + SIGBLOB_LEN - slen);
 
 	if (compat & SSH_BUG_SIGBLOB) {
 		if (sigp != NULL) {
@@ -137,6 +139,7 @@ ssh_dss_verify(const struct sshkey *key,
 	int ret = SSH_ERR_INTERNAL_ERROR;
 	struct sshbuf *b = NULL;
 	char *ktype = NULL;
+	BIGNUM *r = NULL, *s = NULL;
 
 	if (key == NULL || key->dsa == NULL ||
 	    sshkey_type_plain(key->type) != KEY_DSA ||
@@ -177,16 +180,19 @@ ssh_dss_verify(const struct sshkey *key,
 
 	/* parse signature */
 	if ((sig = DSA_SIG_new()) == NULL ||
-	    (sig->r = BN_new()) == NULL ||
-	    (sig->s = BN_new()) == NULL) {
+	    (r = BN_new()) == NULL ||
+	    (s = BN_new()) == NULL) {
 		ret = SSH_ERR_ALLOC_FAIL;
 		goto out;
 	}
-	if ((BN_bin2bn(sigblob, INTBLOB_LEN, sig->r) == NULL) ||
-	    (BN_bin2bn(sigblob+ INTBLOB_LEN, INTBLOB_LEN, sig->s) == NULL)) {
+	if ((BN_bin2bn(sigblob, INTBLOB_LEN, r) == NULL) ||
+	    (BN_bin2bn(sigblob+ INTBLOB_LEN, INTBLOB_LEN, s) == NULL) ||
+	    (DSA_SIG_set0(sig, r, s) == 0)) {
 		ret = SSH_ERR_LIBCRYPTO_ERROR;
 		goto out;
 	}
+	r = NULL;
+	s = NULL;
 
 	/* sha1 the data */
 	if ((ret = ssh_digest_memory(SSH_DIGEST_SHA1, data, datalen,
@@ -207,8 +213,9 @@ ssh_dss_verify(const struct sshkey *key,
 
  out:
 	explicit_bzero(digest, sizeof(digest));
-	if (sig != NULL)
-		DSA_SIG_free(sig);
+	BN_free(r);
+	BN_free(s);
+	DSA_SIG_free(sig);
 	sshbuf_free(b);
 	free(ktype);
 	if (sigblob != NULL) {
