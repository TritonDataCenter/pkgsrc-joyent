$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- kexgexc.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ kexgexc.c
@@ -95,6 +95,7 @@ input_kex_dh_gex_group(int type, u_int32
 	struct kex *kex = ssh->kex;
 	BIGNUM *p = NULL, *g = NULL;
 	int r, bits;
+	const BIGNUM *pub_key;
 
 	debug("got SSH2_MSG_KEX_DH_GEX_GROUP");
 
@@ -119,26 +120,30 @@ input_kex_dh_gex_group(int type, u_int32
 	p = g = NULL; /* belong to kex->dh now */
 
 	/* generate and send 'e', client DH public key */
-	if ((r = dh_gen_key(kex->dh, kex->we_need * 8)) != 0 ||
-	    (r = sshpkt_start(ssh, SSH2_MSG_KEX_DH_GEX_INIT)) != 0 ||
-	    (r = sshpkt_put_bignum2(ssh, kex->dh->pub_key)) != 0 ||
+	if ((r = dh_gen_key(kex->dh, kex->we_need * 8)) != 0)
+		goto out;
+	DH_get0_key(kex->dh, &pub_key, NULL);
+	if ((r = sshpkt_start(ssh, SSH2_MSG_KEX_DH_GEX_INIT)) != 0 ||
+	    (r = sshpkt_put_bignum2(ssh, pub_key)) != 0 ||
 	    (r = sshpkt_send(ssh)) != 0)
 		goto out;
 	debug("SSH2_MSG_KEX_DH_GEX_INIT sent");
 #ifdef DEBUG_KEXDH
 	DHparams_print_fp(stderr, kex->dh);
 	fprintf(stderr, "pub= ");
-	BN_print_fp(stderr, kex->dh->pub_key);
+	BN_print_fp(stderr, pub_key);
 	fprintf(stderr, "\n");
 #endif
 	ssh_dispatch_set(ssh, SSH2_MSG_KEX_DH_GEX_GROUP, NULL);
 	ssh_dispatch_set(ssh, SSH2_MSG_KEX_DH_GEX_REPLY, &input_kex_dh_gex_reply);
 	r = 0;
 out:
-	if (p)
-		BN_clear_free(p);
-	if (g)
-		BN_clear_free(g);
+	BN_clear_free(p);
+	BN_clear_free(g);
+	if (r != 0) {
+		DH_free(kex->dh);
+		kex->dh = NULL;
+	}
 	return r;
 }
 
@@ -153,6 +158,7 @@ input_kex_dh_gex_reply(int type, u_int32
 	u_char hash[SSH_DIGEST_MAX_LENGTH];
 	size_t klen = 0, slen, sbloblen, hashlen;
 	int kout, r;
+	const BIGNUM *p, *g, *pub_key;
 
 	debug("got SSH2_MSG_KEX_DH_GEX_REPLY");
 	if (kex->verify_host_key == NULL) {
@@ -219,6 +225,8 @@ input_kex_dh_gex_reply(int type, u_int32
 		kex->min = kex->max = -1;
 
 	/* calc and verify H */
+	DH_get0_pqg(kex->dh, &p, NULL, &g);
+	DH_get0_key(kex->dh, &pub_key, NULL);
 	hashlen = sizeof(hash);
 	if ((r = kexgex_hash(
 	    kex->hash_alg,
@@ -228,8 +236,8 @@ input_kex_dh_gex_reply(int type, u_int32
 	    sshbuf_ptr(kex->peer), sshbuf_len(kex->peer),
 	    server_host_key_blob, sbloblen,
 	    kex->min, kex->nbits, kex->max,
-	    kex->dh->p, kex->dh->g,
-	    kex->dh->pub_key,
+	    p, g,
+	    pub_key,
 	    dh_server_pub,
 	    shared_secret,
 	    hash, &hashlen)) != 0)
