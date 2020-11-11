$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- sshconnect1.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ sshconnect1.c
@@ -70,6 +70,7 @@ try_agent_authentication(void)
 	u_char response[16];
 	size_t i;
 	BIGNUM *challenge;
+	const BIGNUM *n;
 	struct ssh_identitylist *idlist = NULL;
 
 	/* Get connection to the agent. */
@@ -96,8 +97,9 @@ try_agent_authentication(void)
 		    idlist->comments[i]);
 
 		/* Tell the server that we are willing to authenticate using this key. */
+		RSA_get0_key(idlist->keys[i]->rsa, &n, NULL, NULL);
 		packet_start(SSH_CMSG_AUTH_RSA);
-		packet_put_bignum(idlist->keys[i]->rsa->n);
+		packet_put_bignum((BIGNUM *)n);
 		packet_send();
 		packet_write_wait();
 
@@ -220,6 +222,7 @@ static int
 try_rsa_authentication(int idx)
 {
 	BIGNUM *challenge;
+	const BIGNUM *n;
 	Key *public, *private;
 	char buf[300], *passphrase = NULL, *comment, *authfile;
 	int i, perm_ok = 1, type, quit;
@@ -231,8 +234,9 @@ try_rsa_authentication(int idx)
 	debug("Trying RSA authentication with key '%.100s'", comment);
 
 	/* Tell the server that we are willing to authenticate using this key. */
+	RSA_get0_key(public->rsa, &n, NULL, NULL);
 	packet_start(SSH_CMSG_AUTH_RSA);
-	packet_put_bignum(public->rsa->n);
+	packet_put_bignum((BIGNUM *)n);
 	packet_send();
 	packet_write_wait();
 
@@ -348,15 +352,17 @@ try_rhosts_rsa_authentication(const char
 {
 	int type;
 	BIGNUM *challenge;
+	const BIGNUM *n, *e;
 
 	debug("Trying rhosts or /etc/hosts.equiv with RSA host authentication.");
 
 	/* Tell the server that we are willing to authenticate using this key. */
+	RSA_get0_key(host_key->rsa, &n, &e, NULL);
 	packet_start(SSH_CMSG_AUTH_RHOSTS_RSA);
 	packet_put_cstring(local_user);
-	packet_put_int(BN_num_bits(host_key->rsa->n));
-	packet_put_bignum(host_key->rsa->e);
-	packet_put_bignum(host_key->rsa->n);
+	packet_put_int(BN_num_bits(n));
+	packet_put_bignum((BIGNUM *)e);
+	packet_put_bignum((BIGNUM *)n);
 	packet_send();
 	packet_write_wait();
 
@@ -502,6 +508,8 @@ ssh_kex(char *host, struct sockaddr *hos
 {
 	int i;
 	BIGNUM *key;
+	BIGNUM *server_n = NULL, *server_e = NULL,
+	    *host_n = NULL, *host_e = NULL;
 	Key *host_key, *server_key;
 	int bits, rbits;
 	int ssh_cipher_default = SSH_CIPHER_3DES;
@@ -523,10 +531,14 @@ ssh_kex(char *host, struct sockaddr *hos
 	if ((server_key = key_new(KEY_RSA1)) == NULL)
 		fatal("%s: key_new(KEY_RSA1) failed", __func__);
 	bits = packet_get_int();
-	packet_get_bignum(server_key->rsa->e);
-	packet_get_bignum(server_key->rsa->n);
+	if ((server_e = BN_new()) == NULL ||
+	    (server_n = BN_new()) == NULL)
+		fatal("BN_new() failed");
+	packet_get_bignum(server_e);
+	packet_get_bignum(server_n);
+	RSA_set0_key(server_key->rsa, server_n, server_e, NULL);
 
-	rbits = BN_num_bits(server_key->rsa->n);
+	rbits = BN_num_bits(server_n);
 	if (bits != rbits) {
 		logit("Warning: Server lies about size of server public key: "
 		    "actual size is %d bits vs. announced %d.", rbits, bits);
@@ -536,10 +548,14 @@ ssh_kex(char *host, struct sockaddr *hos
 	if ((host_key = key_new(KEY_RSA1)) == NULL)
 		fatal("%s: key_new(KEY_RSA1) failed", __func__);
 	bits = packet_get_int();
-	packet_get_bignum(host_key->rsa->e);
-	packet_get_bignum(host_key->rsa->n);
+	if ((host_e = BN_new()) == NULL ||
+	    (host_n = BN_new()) == NULL)
+		fatal("BN_new() failed");
+	packet_get_bignum(host_e);
+	packet_get_bignum(host_n);
+	RSA_set0_key(host_key->rsa, host_n, host_e, NULL);
 
-	rbits = BN_num_bits(host_key->rsa->n);
+	rbits = BN_num_bits(host_n);
 	if (bits != rbits) {
 		logit("Warning: Server lies about size of server host key: "
 		    "actual size is %d bits vs. announced %d.", rbits, bits);
@@ -555,14 +571,14 @@ ssh_kex(char *host, struct sockaddr *hos
 	packet_check_eom();
 
 	debug("Received server public key (%d bits) and host key (%d bits).",
-	    BN_num_bits(server_key->rsa->n), BN_num_bits(host_key->rsa->n));
+	    BN_num_bits(server_n), BN_num_bits(host_n));
 
 	if (verify_host_key(host, hostaddr, host_key) == -1)
 		fatal("Host key verification failed.");
 
 	client_flags = SSH_PROTOFLAG_SCREEN_NUMBER | SSH_PROTOFLAG_HOST_IN_FWD_OPEN;
 
-	derive_ssh1_session_id(host_key->rsa->n, server_key->rsa->n, cookie, session_id);
+	derive_ssh1_session_id(host_n, server_n, cookie, session_id);
 
 	/*
 	 * Generate an encryption key for the session.   The key is a 256 bit
@@ -597,14 +613,14 @@ ssh_kex(char *host, struct sockaddr *hos
 	 * Encrypt the integer using the public key and host key of the
 	 * server (key with smaller modulus first).
 	 */
-	if (BN_cmp(server_key->rsa->n, host_key->rsa->n) < 0) {
+	if (BN_cmp(server_n, host_n) < 0) {
 		/* Public key has smaller modulus. */
-		if (BN_num_bits(host_key->rsa->n) <
-		    BN_num_bits(server_key->rsa->n) + SSH_KEY_BITS_RESERVED) {
+		if (BN_num_bits(host_n) <
+		    BN_num_bits(server_n) + SSH_KEY_BITS_RESERVED) {
 			fatal("respond_to_rsa_challenge: host_key %d < server_key %d + "
 			    "SSH_KEY_BITS_RESERVED %d",
-			    BN_num_bits(host_key->rsa->n),
-			    BN_num_bits(server_key->rsa->n),
+			    BN_num_bits(host_n),
+			    BN_num_bits(server_n),
 			    SSH_KEY_BITS_RESERVED);
 		}
 		if (rsa_public_encrypt(key, key, server_key->rsa) != 0 ||
@@ -612,12 +628,12 @@ ssh_kex(char *host, struct sockaddr *hos
 			fatal("%s: rsa_public_encrypt failed", __func__);
 	} else {
 		/* Host key has smaller modulus (or they are equal). */
-		if (BN_num_bits(server_key->rsa->n) <
-		    BN_num_bits(host_key->rsa->n) + SSH_KEY_BITS_RESERVED) {
+		if (BN_num_bits(server_n) <
+		    BN_num_bits(host_n) + SSH_KEY_BITS_RESERVED) {
 			fatal("respond_to_rsa_challenge: server_key %d < host_key %d + "
 			    "SSH_KEY_BITS_RESERVED %d",
-			    BN_num_bits(server_key->rsa->n),
-			    BN_num_bits(host_key->rsa->n),
+			    BN_num_bits(server_n),
+			    BN_num_bits(host_n),
 			    SSH_KEY_BITS_RESERVED);
 		}
 		if (rsa_public_encrypt(key, key, host_key->rsa) != 0 ||
