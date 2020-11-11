$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- kexdhs.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ kexdhs.c
@@ -87,6 +87,10 @@ kexdh_server(struct ssh *ssh)
 	ssh_dispatch_set(ssh, SSH2_MSG_KEXDH_INIT, &input_kex_dh_init);
 	r = 0;
  out:
+	if (r != 0) {
+		DH_free(kex->dh);
+		kex->dh = NULL;
+	}
 	return r;
 }
 
@@ -102,6 +106,7 @@ input_kex_dh_init(int type, u_int32_t se
 	size_t sbloblen, slen;
 	size_t klen = 0, hashlen;
 	int kout, r;
+	const BIGNUM *pub_key;
 
 	if (kex->load_host_public_key == NULL ||
 	    kex->load_host_private_key == NULL) {
@@ -164,6 +169,7 @@ input_kex_dh_init(int type, u_int32_t se
 		goto out;
 	/* calc H */
 	hashlen = sizeof(hash);
+	DH_get0_key(kex->dh, &pub_key, NULL);
 	if ((r = kex_dh_hash(
 	    kex->hash_alg,
 	    kex->client_version_string,
@@ -172,7 +178,7 @@ input_kex_dh_init(int type, u_int32_t se
 	    sshbuf_ptr(kex->my), sshbuf_len(kex->my),
 	    server_host_key_blob, sbloblen,
 	    dh_client_pub,
-	    kex->dh->pub_key,
+	    pub_key,
 	    shared_secret,
 	    hash, &hashlen)) != 0)
 		goto out;
@@ -198,7 +204,7 @@ input_kex_dh_init(int type, u_int32_t se
 	/* send server hostkey, DH pubkey 'f' and singed H */
 	if ((r = sshpkt_start(ssh, SSH2_MSG_KEXDH_REPLY)) != 0 ||
 	    (r = sshpkt_put_string(ssh, server_host_key_blob, sbloblen)) != 0 ||
-	    (r = sshpkt_put_bignum2(ssh, kex->dh->pub_key)) != 0 ||	/* f */
+	    (r = sshpkt_put_bignum2(ssh, pub_key)) != 0 ||	/* f */
 	    (r = sshpkt_put_string(ssh, signature, slen)) != 0 ||
 	    (r = sshpkt_send(ssh)) != 0)
 		goto out;
