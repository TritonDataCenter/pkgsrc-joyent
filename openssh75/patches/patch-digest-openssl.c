$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- digest-openssl.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ digest-openssl.c
@@ -43,7 +43,7 @@
 
 struct ssh_digest_ctx {
 	int alg;
-	EVP_MD_CTX mdctx;
+	EVP_MD_CTX *mdctx;
 };
 
 struct ssh_digest {
@@ -107,7 +107,7 @@ ssh_digest_bytes(int alg)
 size_t
 ssh_digest_blocksize(struct ssh_digest_ctx *ctx)
 {
-	return EVP_MD_CTX_block_size(&ctx->mdctx);
+	return EVP_MD_CTX_block_size(ctx->mdctx);
 }
 
 struct ssh_digest_ctx *
@@ -119,8 +119,9 @@ ssh_digest_start(int alg)
 	if (digest == NULL || ((ret = calloc(1, sizeof(*ret))) == NULL))
 		return NULL;
 	ret->alg = alg;
-	EVP_MD_CTX_init(&ret->mdctx);
-	if (EVP_DigestInit_ex(&ret->mdctx, digest->mdfunc(), NULL) != 1) {
+	ret->mdctx = EVP_MD_CTX_new();
+	if (ret->mdctx == NULL ||
+	    EVP_DigestInit_ex(ret->mdctx, digest->mdfunc(), NULL) != 1) {
 		free(ret);
 		return NULL;
 	}
@@ -133,7 +134,7 @@ ssh_digest_copy_state(struct ssh_digest_
 	if (from->alg != to->alg)
 		return SSH_ERR_INVALID_ARGUMENT;
 	/* we have bcopy-style order while openssl has memcpy-style */
-	if (!EVP_MD_CTX_copy_ex(&to->mdctx, &from->mdctx))
+	if (!EVP_MD_CTX_copy_ex(to->mdctx, from->mdctx))
 		return SSH_ERR_LIBCRYPTO_ERROR;
 	return 0;
 }
@@ -141,7 +142,7 @@ ssh_digest_copy_state(struct ssh_digest_
 int
 ssh_digest_update(struct ssh_digest_ctx *ctx, const void *m, size_t mlen)
 {
-	if (EVP_DigestUpdate(&ctx->mdctx, m, mlen) != 1)
+	if (EVP_DigestUpdate(ctx->mdctx, m, mlen) != 1)
 		return SSH_ERR_LIBCRYPTO_ERROR;
 	return 0;
 }
@@ -162,7 +163,7 @@ ssh_digest_final(struct ssh_digest_ctx *
 		return SSH_ERR_INVALID_ARGUMENT;
 	if (dlen < digest->digest_len) /* No truncation allowed */
 		return SSH_ERR_INVALID_ARGUMENT;
-	if (EVP_DigestFinal_ex(&ctx->mdctx, d, &l) != 1)
+	if (EVP_DigestFinal_ex(ctx->mdctx, d, &l) != 1)
 		return SSH_ERR_LIBCRYPTO_ERROR;
 	if (l != digest->digest_len) /* sanity */
 		return SSH_ERR_INTERNAL_ERROR;
@@ -173,7 +174,7 @@ void
 ssh_digest_free(struct ssh_digest_ctx *ctx)
 {
 	if (ctx != NULL) {
-		EVP_MD_CTX_cleanup(&ctx->mdctx);
+		EVP_MD_CTX_free(ctx->mdctx);
 		explicit_bzero(ctx, sizeof(*ctx));
 		free(ctx);
 	}
