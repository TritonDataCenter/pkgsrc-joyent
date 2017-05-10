$NetBSD$

libwrap patch from https://bugs.mysql.com/bug.php?id=84495

--- sql/conn_handler/socket_connection.cc.orig	2017-04-12 09:57:48.000000000 +0000
+++ sql/conn_handler/socket_connection.cc
@@ -33,7 +33,13 @@
 #include <sys/un.h>
 #endif
 #ifdef HAVE_LIBWRAP
+#ifndef HAVE_LIBWRAP_PROTOTYPES
+extern "C" {
 #include <tcpd.h>
+}
+#else
+#include <tcpd.h>
+#endif
 #include <syslog.h>
 #endif
 
@@ -974,21 +980,30 @@ Channel_info* Mysqld_socket_listener::li
     signal(SIGCHLD, SIG_DFL);
     request_init(&req, RQ_DAEMON, m_libwrap_name, RQ_FILE,
                  mysql_socket_getfd(connect_sock), NULL);
-    fromhost(&req);
+    void (*my_fromhost) (void *) = (void (*)(void *)) fromhost;
+    my_fromhost(&req);
 
-    if (!hosts_access(&req))
+    int (*my_hosts_access) (void *) = (int (*) (void *)) hosts_access;
+    if (!my_hosts_access(&req))
     {
       /*
         This may be stupid but refuse() includes an exit(0)
         which we surely don't want...
         clean_exit() - same stupid thing ...
       */
+      char *(*my_eval_client) (void *) = (char *(*) (void *)) eval_client;
       syslog(LOG_AUTH | m_deny_severity,
-             "refused connect from %s", eval_client(&req));
+             "refused connect from %s", my_eval_client(&req));
 
+#ifdef HAVE_LIBWRAP_PROTOTYPES
+      // Some distros have patched tcpd.h to have proper prototypes
       if (req.sink)
-        (req.sink)(req.fd);
-
+        ((void (*)(int)) (req.sink))(req.fd);
+#else
+      // Some distros have not patched tcpd.h
+      if (req.sink)
+        ((void (*)(int))req.sink)(req.fd);
+#endif
       mysql_socket_shutdown(listen_sock, SHUT_RDWR);
       mysql_socket_close(listen_sock);
       /*
