$NetBSD: patch-client_mysqladmin.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

Redefine signals for Irix.

--- client/mysqladmin.cc.orig	2014-09-05 08:16:57.000000000 +0000
+++ client/mysqladmin.cc
@@ -336,8 +336,14 @@ int main(int argc,char *argv[])
   if (tty_password)
     opt_password = get_tty_password(NullS);
 
-  (void) signal(SIGINT,endprog);			/* Here if abort */
-  (void) signal(SIGTERM,endprog);		/* Here if abort */
+#ifdef IRIX5
+#define _MYSQL_END_TYPE (void (*)(...))
+#else
+#define _MYSQL_END_TYPE
+#endif
+
+  (void) signal(SIGINT,_MYSQL_END_TYPE endprog); /* Here if abort */
+  (void) signal(SIGTERM,_MYSQL_END_TYPE endprog);/* Here if abort */
 
   if (opt_compress)
     mysql_options(&mysql,MYSQL_OPT_COMPRESS,NullS);
