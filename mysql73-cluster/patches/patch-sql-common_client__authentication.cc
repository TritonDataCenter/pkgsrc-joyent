$NetBSD$

Build fix.

--- sql-common/client_authentication.cc.orig	2014-07-02 09:22:14.000000000 +0000
+++ sql-common/client_authentication.cc
@@ -84,7 +84,7 @@ RSA *rsa_init(MYSQL *mysql)
 
   if (mysql->options.extension != NULL &&
       mysql->options.extension->server_public_key_path != NULL &&
-      mysql->options.extension->server_public_key_path != '\0')
+      mysql->options.extension->server_public_key_path[0] != '\0')
   {
     pub_key_file= fopen(mysql->options.extension->server_public_key_path,
                         "r");
