$NetBSD$

Fix build.

--- lib/mysql_connection.cpp.orig	2017-04-12 14:37:03.630523769 +0000
+++ lib/mysql_connection.cpp
@@ -1,6 +1,7 @@
 #include "proxysql.h"
 #include "cpp.h"
 #include "SpookyV2.h"
+#include <strings.h>
 
 extern const CHARSET_INFO * proxysql_find_charset_nr(unsigned int nr);
 
