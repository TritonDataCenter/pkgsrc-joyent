$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- kexdhc.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ kexdhc.c
@@ -56,6 +56,7 @@ kexdh_client(struct ssh *ssh)
 {
 	struct kex *kex = ssh->kex;
 	int r;
+	const BIGNUM *pub_key;
 
 	/* generate and send 'e', client DH public key */
 	switch (kex->kex_type) {
@@ -81,21 +82,27 @@ kexdh_client(struct ssh *ssh)
 		goto out;
 	}
 	debug("sending SSH2_MSG_KEXDH_INIT");
-	if ((r = dh_gen_key(kex->dh, kex->we_need * 8)) != 0 ||
-	    (r = sshpkt_start(ssh, SSH2_MSG_KEXDH_INIT)) != 0 ||
-	    (r = sshpkt_put_bignum2(ssh, kex->dh->pub_key)) != 0 ||
+	if ((r = dh_gen_key(kex->dh, kex->we_need * 8)) != 0)
+		goto out;
+	DH_get0_key(kex->dh, &pub_key, NULL);
+	if ((r = sshpkt_start(ssh, SSH2_MSG_KEXDH_INIT)) != 0 ||
+	    (r = sshpkt_put_bignum2(ssh, pub_key)) != 0 ||
 	    (r = sshpkt_send(ssh)) != 0)
 		goto out;
 #ifdef DEBUG_KEXDH
 	DHparams_print_fp(stderr, kex->dh);
 	fprintf(stderr, "pub= ");
-	BN_print_fp(stderr, kex->dh->pub_key);
+	BN_print_fp(stderr, pub_key);
 	fprintf(stderr, "\n");
 #endif
 	debug("expecting SSH2_MSG_KEXDH_REPLY");
 	ssh_dispatch_set(ssh, SSH2_MSG_KEXDH_REPLY, &input_kex_dh);
 	r = 0;
  out:
+	if (r != 0) {
+		DH_free(kex->dh);
+		kex->dh = NULL;
+	}
 	return r;
 }
 
@@ -110,6 +117,7 @@ input_kex_dh(int type, u_int32_t seq, vo
 	u_char hash[SSH_DIGEST_MAX_LENGTH];
 	size_t klen = 0, slen, sbloblen, hashlen;
 	int kout, r;
+	const BIGNUM *pub_key;
 
 	if (kex->verify_host_key == NULL) {
 		r = SSH_ERR_INVALID_ARGUMENT;
@@ -169,6 +177,7 @@ input_kex_dh(int type, u_int32_t seq, vo
 #endif
 
 	/* calc and verify H */
+	DH_get0_key(kex->dh, &pub_key, NULL);
 	hashlen = sizeof(hash);
 	if ((r = kex_dh_hash(
 	    kex->hash_alg,
@@ -177,7 +186,7 @@ input_kex_dh(int type, u_int32_t seq, vo
 	    sshbuf_ptr(kex->my), sshbuf_len(kex->my),
 	    sshbuf_ptr(kex->peer), sshbuf_len(kex->peer),
 	    server_host_key_blob, sbloblen,
-	    kex->dh->pub_key,
+	    pub_key,
 	    dh_server_pub,
 	    shared_secret,
 	    hash, &hashlen)) != 0)
