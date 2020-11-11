$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- cipher-bf1.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ cipher-bf1.c
@@ -89,17 +89,28 @@ bf_ssh1_cipher(EVP_CIPHER_CTX *ctx, u_ch
 const EVP_CIPHER *
 evp_ssh1_bf(void)
 {
-	static EVP_CIPHER ssh1_bf;
+	EVP_CIPHER *ssh1_bf;
 
-	memcpy(&ssh1_bf, EVP_bf_cbc(), sizeof(EVP_CIPHER));
-	orig_bf = ssh1_bf.do_cipher;
-	ssh1_bf.nid = NID_undef;
+	orig_bf = EVP_CIPHER_meth_get_do_cipher(EVP_bf_cbc());
+	/* block_size, length, flags from openssl/crypto/engine/eng_cryptodev.c:638 */
+	ssh1_bf = EVP_CIPHER_meth_new(NID_undef, 8, 32);
+	EVP_CIPHER_meth_set_iv_length(ssh1_bf, 8);
+	EVP_CIPHER_meth_set_flags(ssh1_bf, EVP_CIPH_CBC_MODE);
 #ifdef SSH_OLD_EVP
-	ssh1_bf.init = bf_ssh1_init;
+	EVP_CIPHER_meth_set_init(ssh1_bf, ssh1_bf_init);
+#else
+	EVP_CIPHER_meth_set_init(ssh1_bf,
+	    EVP_CIPHER_meth_get_init(EVP_bf_cbc()));
 #endif
-	ssh1_bf.do_cipher = bf_ssh1_cipher;
-	ssh1_bf.key_len = 32;
-	return (&ssh1_bf);
+	/* copy methods and parameters from old EVP_BF_cbc()
+	 * meth_dup does not allow to change type and key_len */
+	EVP_CIPHER_meth_set_cleanup(ssh1_bf,
+	    EVP_CIPHER_meth_get_cleanup(EVP_bf_cbc()));
+	EVP_CIPHER_meth_set_ctrl(ssh1_bf,
+	    EVP_CIPHER_meth_get_ctrl(EVP_bf_cbc()));
+	/* ASN1 params??? */
+	EVP_CIPHER_meth_set_do_cipher(ssh1_bf, bf_ssh1_cipher);
+	return ssh1_bf;
 }
 #endif /* defined(WITH_OPENSSL) && !defined(OPENSSL_NO_BF) */
 
