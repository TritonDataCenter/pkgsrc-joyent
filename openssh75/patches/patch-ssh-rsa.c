$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-rsa.c.orig	2020-11-11 10:57:57.000000000 +0000
+++ ssh-rsa.c
@@ -100,7 +100,7 @@ ssh_rsa_sign(const struct sshkey *key, u
 		hash_alg = rsa_hash_alg_from_ident(alg_ident);
 	if (key == NULL || key->rsa == NULL || hash_alg == -1 ||
 	    sshkey_type_plain(key->type) != KEY_RSA ||
-	    BN_num_bits(key->rsa->n) < SSH_RSA_MINIMUM_MODULUS_SIZE)
+	    RSA_bits(key->rsa) < SSH_RSA_MINIMUM_MODULUS_SIZE)
 		return SSH_ERR_INVALID_ARGUMENT;
 	slen = RSA_size(key->rsa);
 	if (slen <= 0 || slen > SSHBUF_MAX_BIGNUM)
@@ -172,7 +172,7 @@ ssh_rsa_verify(const struct sshkey *key,
 
 	if (key == NULL || key->rsa == NULL ||
 	    sshkey_type_plain(key->type) != KEY_RSA ||
-	    BN_num_bits(key->rsa->n) < SSH_RSA_MINIMUM_MODULUS_SIZE ||
+	    RSA_bits(key->rsa) < SSH_RSA_MINIMUM_MODULUS_SIZE ||
 	    sig == NULL || siglen == 0)
 		return SSH_ERR_INVALID_ARGUMENT;
 
