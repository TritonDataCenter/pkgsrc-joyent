$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- kexgexs.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ kexgexs.c
@@ -73,6 +73,7 @@ input_kex_dh_gex_request(int type, u_int
 	struct kex *kex = ssh->kex;
 	int r;
 	u_int min = 0, max = 0, nbits = 0;
+	const BIGNUM *p, *g;
 
 	debug("SSH2_MSG_KEX_DH_GEX_REQUEST received");
 	if ((r = sshpkt_get_u32(ssh, &min)) != 0 ||
@@ -102,9 +103,10 @@ input_kex_dh_gex_request(int type, u_int
 		goto out;
 	}
 	debug("SSH2_MSG_KEX_DH_GEX_GROUP sent");
+	DH_get0_pqg(kex->dh, &p, NULL, &g);
 	if ((r = sshpkt_start(ssh, SSH2_MSG_KEX_DH_GEX_GROUP)) != 0 ||
-	    (r = sshpkt_put_bignum2(ssh, kex->dh->p)) != 0 ||
-	    (r = sshpkt_put_bignum2(ssh, kex->dh->g)) != 0 ||
+	    (r = sshpkt_put_bignum2(ssh, p)) != 0 ||
+	    (r = sshpkt_put_bignum2(ssh, g)) != 0 ||
 	    (r = sshpkt_send(ssh)) != 0)
 		goto out;
 
@@ -116,6 +118,10 @@ input_kex_dh_gex_request(int type, u_int
 	ssh_dispatch_set(ssh, SSH2_MSG_KEX_DH_GEX_INIT, &input_kex_dh_gex_init);
 	r = 0;
  out:
+	if (r != 0) {
+		DH_free(kex->dh);
+		kex->dh = NULL;
+	}
 	return r;
 }
 
@@ -131,6 +137,7 @@ input_kex_dh_gex_init(int type, u_int32_
 	size_t sbloblen, slen;
 	size_t klen = 0, hashlen;
 	int kout, r;
+	const BIGNUM *p, *g, *pub_key;
 
 	if (kex->load_host_public_key == NULL ||
 	    kex->load_host_private_key == NULL) {
@@ -193,6 +200,8 @@ input_kex_dh_gex_init(int type, u_int32_
 		goto out;
 	/* calc H */
 	hashlen = sizeof(hash);
+	DH_get0_pqg(kex->dh, &p, NULL, &g);
+	DH_get0_key(kex->dh, &pub_key, NULL);
 	if ((r = kexgex_hash(
 	    kex->hash_alg,
 	    kex->client_version_string,
@@ -201,9 +210,9 @@ input_kex_dh_gex_init(int type, u_int32_
 	    sshbuf_ptr(kex->my), sshbuf_len(kex->my),
 	    server_host_key_blob, sbloblen,
 	    kex->min, kex->nbits, kex->max,
-	    kex->dh->p, kex->dh->g,
+	    p, g,
 	    dh_client_pub,
-	    kex->dh->pub_key,
+	    pub_key,
 	    shared_secret,
 	    hash, &hashlen)) != 0)
 		goto out;
@@ -229,7 +238,7 @@ input_kex_dh_gex_init(int type, u_int32_
 	/* send server hostkey, DH pubkey 'f' and singed H */
 	if ((r = sshpkt_start(ssh, SSH2_MSG_KEX_DH_GEX_REPLY)) != 0 ||
 	    (r = sshpkt_put_string(ssh, server_host_key_blob, sbloblen)) != 0 ||
-	    (r = sshpkt_put_bignum2(ssh, kex->dh->pub_key)) != 0 ||     /* f */
+	    (r = sshpkt_put_bignum2(ssh, pub_key)) != 0 ||     /* f */
 	    (r = sshpkt_put_string(ssh, signature, slen)) != 0 ||
 	    (r = sshpkt_send(ssh)) != 0)
 		goto out;
