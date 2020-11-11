$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- rsa.h.orig	2020-11-11 11:16:04.000000000 +0000
+++ rsa.h
@@ -21,6 +21,6 @@
 
 int	 rsa_public_encrypt(BIGNUM *, BIGNUM *, RSA *);
 int	 rsa_private_decrypt(BIGNUM *, BIGNUM *, RSA *);
-int	 rsa_generate_additional_parameters(RSA *);
+int	 rsa_generate_additional_parameters(RSA *, BIGNUM *);
 
 #endif				/* RSA_H */
