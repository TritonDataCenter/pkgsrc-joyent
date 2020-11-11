$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-pkcs11-client.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ ssh-pkcs11-client.c
@@ -143,12 +143,14 @@ pkcs11_rsa_private_encrypt(int flen, con
 static int
 wrap_key(RSA *rsa)
 {
-	static RSA_METHOD helper_rsa;
+	static RSA_METHOD *helper_rsa;
 
-	memcpy(&helper_rsa, RSA_get_default_method(), sizeof(helper_rsa));
-	helper_rsa.name = "ssh-pkcs11-helper";
-	helper_rsa.rsa_priv_enc = pkcs11_rsa_private_encrypt;
-	RSA_set_method(rsa, &helper_rsa);
+	if (helper_rsa == NULL) {
+		helper_rsa = RSA_meth_dup(RSA_get_default_method());
+		RSA_meth_set1_name(helper_rsa, "ssh-pkcs11-helper");
+		RSA_meth_set_priv_enc(helper_rsa, pkcs11_rsa_private_encrypt);
+	}
+	RSA_set_method(rsa, helper_rsa);
 	return (0);
 }
 
