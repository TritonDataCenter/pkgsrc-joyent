$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- sshconnect2.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ sshconnect2.c
@@ -235,6 +235,7 @@ ssh_kex2(char *host, struct sockaddr *ho
 	packet_send();
 	packet_write_wait();
 #endif
+	/* XXX free myproposal ?? */
 }
 
 /*
