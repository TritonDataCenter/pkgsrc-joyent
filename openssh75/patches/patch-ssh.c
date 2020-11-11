$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- ssh.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ ssh.c
@@ -1231,6 +1231,7 @@ main(int ac, char **av)
 		free(cp);
 	}
 	free(conn_hash_hex);
+	free(host_arg);
 
 	if (config_test) {
 		dump_client_config(&options, host);
