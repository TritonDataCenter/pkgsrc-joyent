$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- cipher.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ cipher.c
@@ -372,7 +372,7 @@ cipher_init(struct sshcipher_ctx **ccp, 
 		ret = SSH_ERR_ALLOC_FAIL;
 		goto out;
 	}
-	if (EVP_CipherInit(cc->evp, type, NULL, (u_char *)iv,
+	if (EVP_CipherInit(cc->evp, type, (u_char *)key, (u_char *)iv,
 	    (do_encrypt == CIPHER_ENCRYPT)) == 0) {
 		ret = SSH_ERR_LIBCRYPTO_ERROR;
 		goto out;
@@ -390,10 +390,6 @@ cipher_init(struct sshcipher_ctx **ccp, 
 			goto out;
 		}
 	}
-	if (EVP_CipherInit(cc->evp, NULL, (u_char *)key, NULL, -1) == 0) {
-		ret = SSH_ERR_LIBCRYPTO_ERROR;
-		goto out;
-	}
 
 	if (cipher->discard_len > 0) {
 		if ((junk = malloc(cipher->discard_len)) == NULL ||
@@ -625,7 +621,7 @@ cipher_get_keyiv(struct sshcipher_ctx *c
 			   len, iv))
 			       return SSH_ERR_LIBCRYPTO_ERROR;
 		} else
-			memcpy(iv, cc->evp->iv, len);
+			memcpy(iv, EVP_CIPHER_CTX_iv(cc->evp), len);
 		break;
 #endif
 #ifdef WITH_SSH1
@@ -671,7 +667,7 @@ cipher_set_keyiv(struct sshcipher_ctx *c
 			    EVP_CTRL_GCM_SET_IV_FIXED, -1, (void *)iv))
 				return SSH_ERR_LIBCRYPTO_ERROR;
 		} else
-			memcpy(cc->evp->iv, iv, evplen);
+			memcpy(EVP_CIPHER_CTX_iv_noconst(cc->evp), iv, evplen);
 		break;
 #endif
 #ifdef WITH_SSH1
@@ -685,8 +681,8 @@ cipher_set_keyiv(struct sshcipher_ctx *c
 }
 
 #ifdef WITH_OPENSSL
-#define EVP_X_STATE(evp)	(evp)->cipher_data
-#define EVP_X_STATE_LEN(evp)	(evp)->cipher->ctx_size
+#define EVP_X_STATE(evp)	EVP_CIPHER_CTX_get_cipher_data(evp)
+#define EVP_X_STATE_LEN(evp)	EVP_CIPHER_impl_ctx_size(EVP_CIPHER_CTX_cipher(evp))
 #endif
 
 int
