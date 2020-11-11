$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-pkcs11.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ ssh-pkcs11.c
@@ -67,7 +67,7 @@ struct pkcs11_key {
 	struct pkcs11_provider	*provider;
 	CK_ULONG		slotidx;
 	int			(*orig_finish)(RSA *rsa);
-	RSA_METHOD		rsa_method;
+	RSA_METHOD		*rsa_method;
 	char			*keyid;
 	int			keyid_len;
 };
@@ -326,13 +326,21 @@ pkcs11_rsa_wrap(struct pkcs11_provider *
 		k11->keyid = xmalloc(k11->keyid_len);
 		memcpy(k11->keyid, keyid_attrib->pValue, k11->keyid_len);
 	}
-	k11->orig_finish = def->finish;
-	memcpy(&k11->rsa_method, def, sizeof(k11->rsa_method));
-	k11->rsa_method.name = "pkcs11";
-	k11->rsa_method.rsa_priv_enc = pkcs11_rsa_private_encrypt;
-	k11->rsa_method.rsa_priv_dec = pkcs11_rsa_private_decrypt;
-	k11->rsa_method.finish = pkcs11_rsa_finish;
-	RSA_set_method(rsa, &k11->rsa_method);
+	k11->orig_finish = RSA_meth_get_finish(def);
+	if ((k11->rsa_method = RSA_meth_dup(def)) == NULL ||
+	    RSA_meth_set1_name(k11->rsa_method, "pkcs11") == 0 ||
+	    RSA_meth_set_priv_enc(k11->rsa_method, pkcs11_rsa_private_encrypt) == 0 ||
+	    RSA_meth_set_priv_dec(k11->rsa_method, pkcs11_rsa_private_decrypt) == 0 ||
+	    RSA_meth_set_finish(k11->rsa_method, pkcs11_rsa_finish) == 0) {
+		RSA_meth_free(k11->rsa_method);
+		k11->rsa_method = NULL;
+		pkcs11_provider_unref(k11->provider);
+		free(k11->keyid);
+		free(k11);
+		return (-1);
+	}
+
+	RSA_set_method(rsa, k11->rsa_method);
 	RSA_set_app_data(rsa, k11);
 	return (0);
 }
@@ -460,6 +468,7 @@ pkcs11_fetch_keys_filter(struct pkcs11_p
 	CK_ULONG		nfound;
 	CK_SESSION_HANDLE	session;
 	CK_FUNCTION_LIST	*f;
+	const BIGNUM		*n, *e;
 
 	f = p->function_list;
 	session = p->slotinfo[slotidx].session;
@@ -512,10 +521,14 @@ pkcs11_fetch_keys_filter(struct pkcs11_p
 			if ((rsa = RSA_new()) == NULL) {
 				error("RSA_new failed");
 			} else {
-				rsa->n = BN_bin2bn(attribs[1].pValue,
+				BIGNUM *rsa_n, *rsa_e;
+
+				rsa_n = BN_bin2bn(attribs[1].pValue,
 				    attribs[1].ulValueLen, NULL);
-				rsa->e = BN_bin2bn(attribs[2].pValue,
+				rsa_e = BN_bin2bn(attribs[2].pValue,
 				    attribs[2].ulValueLen, NULL);
+				if (RSA_set0_key(rsa, rsa_n, rsa_e, NULL) == 0)
+					error("RSA_set0_key failed");
 			}
 		} else {
 			cp = attribs[2].pValue;
@@ -525,17 +538,18 @@ pkcs11_fetch_keys_filter(struct pkcs11_p
 			    == NULL) {
 				error("d2i_X509 failed");
 			} else if ((evp = X509_get_pubkey(x509)) == NULL ||
-			    evp->type != EVP_PKEY_RSA ||
-			    evp->pkey.rsa == NULL) {
+			    EVP_PKEY_id(evp) != EVP_PKEY_RSA ||
+			    EVP_PKEY_get0_RSA(evp) == NULL) {
 				debug("X509_get_pubkey failed or no rsa");
-			} else if ((rsa = RSAPublicKey_dup(evp->pkey.rsa))
+			} else if ((rsa = RSAPublicKey_dup(EVP_PKEY_get0_RSA(evp)))
 			    == NULL) {
 				error("RSAPublicKey_dup");
 			}
 			if (x509)
 				X509_free(x509);
 		}
-		if (rsa && rsa->n && rsa->e &&
+		RSA_get0_key(rsa, &n, &e, NULL);
+		if (rsa && n && e &&
 		    pkcs11_rsa_wrap(p, slotidx, &attribs[0], rsa) == 0) {
 			key = sshkey_new(KEY_UNSPEC);
 			key->rsa = rsa;
