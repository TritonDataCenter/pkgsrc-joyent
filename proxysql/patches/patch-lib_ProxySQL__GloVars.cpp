$NetBSD$

Default paths.

--- lib/ProxySQL_GloVars.cpp.orig	2018-09-21 20:55:57.000000000 +0000
+++ lib/ProxySQL_GloVars.cpp
@@ -200,9 +200,9 @@ void ProxySQL_GlobalVariables::process_o
 		if (Proxy_file_regular(config_file)==false) {
 			config_file=(char *)"proxysql.cfg";
 			if (Proxy_file_regular(config_file)==false) {
-				config_file=(char *)"/etc/proxysql.cnf";
+				config_file=(char *)"@PKG_SYSCONFDIR@/proxysql.cnf";
 				if (Proxy_file_regular(config_file)==false) {
-					config_file=(char *)"/etc/proxysql.cfg";
+					config_file=(char *)"@PKG_SYSCONFDIR@/proxysql.cfg";
 				}
 			}
 		}
