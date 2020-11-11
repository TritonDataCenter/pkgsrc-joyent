$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- sshconnect.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ sshconnect.c
@@ -1363,6 +1363,7 @@ ssh_login(Sensitive *sensitive, const ch
 	char *server_user, *local_user;
 
 	local_user = xstrdup(pw->pw_name);
+	free(pw);
 	server_user = options.user ? options.user : local_user;
 
 	/* Convert the user-supplied hostname into all lowercase. */
