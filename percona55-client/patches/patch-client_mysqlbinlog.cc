$NetBSD: patch-client_mysqlbinlog.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

* Portability: include <bstring.h> if exists.

--- client/mysqlbinlog.cc.orig	2015-01-07 09:49:52.000000000 +0000
+++ client/mysqlbinlog.cc
@@ -38,6 +38,9 @@
 #include "sql_common.h"
 #include "my_dir.h"
 #include <welcome_copyright_notice.h> // ORACLE_WELCOME_COPYRIGHT_NOTICE
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
 
 /* Needed for Rpl_filter */
 CHARSET_INFO* system_charset_info= &my_charset_utf8_general_ci;
