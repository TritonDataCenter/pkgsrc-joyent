$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- cipher-3des1.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ cipher-3des1.c
@@ -44,7 +44,7 @@
  */
 struct ssh1_3des_ctx
 {
-	EVP_CIPHER_CTX	k1, k2, k3;
+	EVP_CIPHER_CTX	*k1, *k2, *k3;
 };
 
 const EVP_CIPHER * evp_ssh1_3des(void);
@@ -65,7 +65,7 @@ ssh1_3des_init(EVP_CIPHER_CTX *ctx, cons
 	if (key == NULL)
 		return 1;
 	if (enc == -1)
-		enc = ctx->encrypt;
+		enc = EVP_CIPHER_CTX_encrypting(ctx);
 	k1 = k2 = k3 = (u_char *) key;
 	k2 += 8;
 	if (EVP_CIPHER_CTX_key_length(ctx) >= 16+8) {
@@ -74,12 +74,19 @@ ssh1_3des_init(EVP_CIPHER_CTX *ctx, cons
 		else
 			k1 += 16;
 	}
-	EVP_CIPHER_CTX_init(&c->k1);
-	EVP_CIPHER_CTX_init(&c->k2);
-	EVP_CIPHER_CTX_init(&c->k3);
-	if (EVP_CipherInit(&c->k1, EVP_des_cbc(), k1, NULL, enc) == 0 ||
-	    EVP_CipherInit(&c->k2, EVP_des_cbc(), k2, NULL, !enc) == 0 ||
-	    EVP_CipherInit(&c->k3, EVP_des_cbc(), k3, NULL, enc) == 0) {
+	c->k1 = EVP_CIPHER_CTX_new();
+	c->k2 = EVP_CIPHER_CTX_new();
+	c->k3 = EVP_CIPHER_CTX_new();
+	if (c->k1 == NULL || c->k2 == NULL || c->k3 == NULL) {
+		EVP_CIPHER_CTX_free(c->k1);
+		EVP_CIPHER_CTX_free(c->k2);
+		EVP_CIPHER_CTX_free(c->k3);
+		free(c);
+		return 0;
+	}
+	if (EVP_CipherInit(c->k1, EVP_des_cbc(), k1, NULL, enc) == 0 ||
+	    EVP_CipherInit(c->k2, EVP_des_cbc(), k2, NULL, !enc) == 0 ||
+	    EVP_CipherInit(c->k3, EVP_des_cbc(), k3, NULL, enc) == 0) {
 		explicit_bzero(c, sizeof(*c));
 		free(c);
 		EVP_CIPHER_CTX_set_app_data(ctx, NULL);
@@ -95,9 +102,9 @@ ssh1_3des_cbc(EVP_CIPHER_CTX *ctx, u_cha
 
 	if ((c = EVP_CIPHER_CTX_get_app_data(ctx)) == NULL)
 		return 0;
-	if (EVP_Cipher(&c->k1, dest, (u_char *)src, len) == 0 ||
-	    EVP_Cipher(&c->k2, dest, dest, len) == 0 ||
-	    EVP_Cipher(&c->k3, dest, dest, len) == 0)
+	if (EVP_Cipher(c->k1, dest, (u_char *)src, len) == 0 ||
+	    EVP_Cipher(c->k2, dest, dest, len) == 0 ||
+	    EVP_Cipher(c->k3, dest, dest, len) == 0)
 		return 0;
 	return 1;
 }
@@ -108,9 +115,9 @@ ssh1_3des_cleanup(EVP_CIPHER_CTX *ctx)
 	struct ssh1_3des_ctx *c;
 
 	if ((c = EVP_CIPHER_CTX_get_app_data(ctx)) != NULL) {
-		EVP_CIPHER_CTX_cleanup(&c->k1);
-		EVP_CIPHER_CTX_cleanup(&c->k2);
-		EVP_CIPHER_CTX_cleanup(&c->k3);
+		EVP_CIPHER_CTX_free(c->k1);
+		EVP_CIPHER_CTX_free(c->k2);
+		EVP_CIPHER_CTX_free(c->k3);
 		explicit_bzero(c, sizeof(*c));
 		free(c);
 		EVP_CIPHER_CTX_set_app_data(ctx, NULL);
@@ -128,13 +135,13 @@ ssh1_3des_iv(EVP_CIPHER_CTX *evp, int do
 	if ((c = EVP_CIPHER_CTX_get_app_data(evp)) == NULL)
 		return SSH_ERR_INTERNAL_ERROR;
 	if (doset) {
-		memcpy(c->k1.iv, iv, 8);
-		memcpy(c->k2.iv, iv + 8, 8);
-		memcpy(c->k3.iv, iv + 16, 8);
+		memcpy(EVP_CIPHER_CTX_iv_noconst(c->k1), iv, 8);
+		memcpy(EVP_CIPHER_CTX_iv_noconst(c->k2), iv + 8, 8);
+		memcpy(EVP_CIPHER_CTX_iv_noconst(c->k3), iv + 16, 8);
 	} else {
-		memcpy(iv, c->k1.iv, 8);
-		memcpy(iv + 8, c->k2.iv, 8);
-		memcpy(iv + 16, c->k3.iv, 8);
+		memcpy(iv, EVP_CIPHER_CTX_iv(c->k1), 8);
+		memcpy(iv + 8, EVP_CIPHER_CTX_iv(c->k2), 8);
+		memcpy(iv + 16, EVP_CIPHER_CTX_iv(c->k3), 8);
 	}
 	return 0;
 }
@@ -142,17 +149,14 @@ ssh1_3des_iv(EVP_CIPHER_CTX *evp, int do
 const EVP_CIPHER *
 evp_ssh1_3des(void)
 {
-	static EVP_CIPHER ssh1_3des;
+	EVP_CIPHER *ssh1_3des;
 
-	memset(&ssh1_3des, 0, sizeof(ssh1_3des));
-	ssh1_3des.nid = NID_undef;
-	ssh1_3des.block_size = 8;
-	ssh1_3des.iv_len = 0;
-	ssh1_3des.key_len = 16;
-	ssh1_3des.init = ssh1_3des_init;
-	ssh1_3des.cleanup = ssh1_3des_cleanup;
-	ssh1_3des.do_cipher = ssh1_3des_cbc;
-	ssh1_3des.flags = EVP_CIPH_CBC_MODE | EVP_CIPH_VARIABLE_LENGTH;
-	return &ssh1_3des;
+	ssh1_3des = EVP_CIPHER_meth_new(NID_undef, 8, 16);
+	EVP_CIPHER_meth_set_iv_length(ssh1_3des, 0);
+	EVP_CIPHER_meth_set_init(ssh1_3des, ssh1_3des_init);
+	EVP_CIPHER_meth_set_cleanup(ssh1_3des, ssh1_3des_cleanup);
+	EVP_CIPHER_meth_set_do_cipher(ssh1_3des, ssh1_3des_cbc);
+	EVP_CIPHER_meth_set_flags(ssh1_3des, EVP_CIPH_CBC_MODE | EVP_CIPH_VARIABLE_LENGTH);
+	return ssh1_3des;
 }
 #endif /* WITH_SSH1 */
