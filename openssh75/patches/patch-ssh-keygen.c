$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh-keygen.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ ssh-keygen.c
@@ -482,40 +482,67 @@ do_convert_private_ssh2_from_blob(u_char
 	free(type);
 
 	switch (key->type) {
-	case KEY_DSA:
-		buffer_get_bignum_bits(b, key->dsa->p);
-		buffer_get_bignum_bits(b, key->dsa->g);
-		buffer_get_bignum_bits(b, key->dsa->q);
-		buffer_get_bignum_bits(b, key->dsa->pub_key);
-		buffer_get_bignum_bits(b, key->dsa->priv_key);
+	case KEY_DSA: {
+			BIGNUM *p = NULL, *g = NULL, *q = NULL, *pub_key = NULL, *priv_key = NULL;
+
+			if ((p = BN_new()) == NULL ||
+			    (g = BN_new()) == NULL ||
+			    (q = BN_new()) == NULL ||
+			    (pub_key = BN_new()) == NULL ||
+			    (priv_key = BN_new()) == NULL)
+				fatal("BN_new() failed");
+			buffer_get_bignum_bits(b, p);
+			buffer_get_bignum_bits(b, g);
+			buffer_get_bignum_bits(b, q);
+			buffer_get_bignum_bits(b, pub_key);
+			buffer_get_bignum_bits(b, priv_key);
+			if (DSA_set0_pqg(key->dsa, p, q, g) == 0 ||
+			    DSA_set0_key(key->dsa, pub_key, priv_key) == 0) {
+				fatal("failed to set DSA key");
+			}
+		}
 		break;
-	case KEY_RSA:
-		if ((r = sshbuf_get_u8(b, &e1)) != 0 ||
-		    (e1 < 30 && (r = sshbuf_get_u8(b, &e2)) != 0) ||
-		    (e1 < 30 && (r = sshbuf_get_u8(b, &e3)) != 0))
-			fatal("%s: buffer error: %s", __func__, ssh_err(r));
-		e = e1;
-		debug("e %lx", e);
-		if (e < 30) {
-			e <<= 8;
-			e += e2;
-			debug("e %lx", e);
-			e <<= 8;
-			e += e3;
+	case KEY_RSA: {
+			BIGNUM *bn_e = NULL, *bn_d = NULL, *bn_n = NULL, *bn_iqmp = NULL, *bn_p = NULL, *bn_q = NULL;
+
+			if ((bn_e = BN_new()) == NULL ||
+			    (bn_d = BN_new()) == NULL ||
+			    (bn_n = BN_new()) == NULL ||
+			    (bn_iqmp = BN_new()) == NULL ||
+			    (bn_p = BN_new()) == NULL ||
+			    (bn_q = BN_new()) == NULL)
+				fatal("BN_new() failed");
+
+			if ((r = sshbuf_get_u8(b, &e1)) != 0 ||
+			    (e1 < 30 && (r = sshbuf_get_u8(b, &e2)) != 0) ||
+			    (e1 < 30 && (r = sshbuf_get_u8(b, &e3)) != 0))
+				fatal("%s: buffer error: %s", __func__, ssh_err(r));
+			e = e1;
 			debug("e %lx", e);
+			if (e < 30) {
+				e <<= 8;
+				e += e2;
+				debug("e %lx", e);
+				e <<= 8;
+				e += e3;
+				debug("e %lx", e);
+			}
+			if (!BN_set_word(bn_e, e)) {
+				sshbuf_free(b);
+				sshkey_free(key);
+				return NULL;
+			}
+			buffer_get_bignum_bits(b, bn_d);
+			buffer_get_bignum_bits(b, bn_n);
+			buffer_get_bignum_bits(b, bn_iqmp);
+			buffer_get_bignum_bits(b, bn_q);
+			buffer_get_bignum_bits(b, bn_p);
+			if (RSA_set0_key(key->rsa, bn_n, bn_e, bn_d) == 0 ||
+			    RSA_set0_factors(key->rsa, bn_p, bn_q) == 0)
+				fatal("Failed to set RSA parameters");
+			if ((r = rsa_generate_additional_parameters(key->rsa, bn_iqmp)) != 0)
+				fatal("generate RSA parameters failed: %s", ssh_err(r));
 		}
-		if (!BN_set_word(key->rsa->e, e)) {
-			sshbuf_free(b);
-			sshkey_free(key);
-			return NULL;
-		}
-		buffer_get_bignum_bits(b, key->rsa->d);
-		buffer_get_bignum_bits(b, key->rsa->n);
-		buffer_get_bignum_bits(b, key->rsa->iqmp);
-		buffer_get_bignum_bits(b, key->rsa->q);
-		buffer_get_bignum_bits(b, key->rsa->p);
-		if ((r = rsa_generate_additional_parameters(key->rsa)) != 0)
-			fatal("generate RSA parameters failed: %s", ssh_err(r));
 		break;
 	}
 	rlen = sshbuf_len(b);
@@ -623,7 +650,7 @@ do_convert_from_pkcs8(struct sshkey **k,
 		    identity_file);
 	}
 	fclose(fp);
-	switch (EVP_PKEY_type(pubkey->type)) {
+	switch (EVP_PKEY_base_id(pubkey)) {
 	case EVP_PKEY_RSA:
 		if ((*k = sshkey_new(KEY_UNSPEC)) == NULL)
 			fatal("sshkey_new failed");
@@ -647,7 +674,7 @@ do_convert_from_pkcs8(struct sshkey **k,
 #endif
 	default:
 		fatal("%s: unsupported pubkey type %d", __func__,
-		    EVP_PKEY_type(pubkey->type));
+		    EVP_PKEY_base_id(pubkey));
 	}
 	EVP_PKEY_free(pubkey);
 	return;
@@ -1689,6 +1716,7 @@ do_ca_sign(struct passwd *pw, int argc, 
 #ifdef ENABLE_PKCS11
 	pkcs11_terminate();
 #endif
+	free(ca);
 	exit(0);
 }
 
