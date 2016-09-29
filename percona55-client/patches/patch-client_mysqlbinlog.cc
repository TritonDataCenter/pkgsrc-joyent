$NetBSD: patch-client_mysqlbinlog.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

* Portability: include <bstring.h> if exists.

--- client/mysqlbinlog.cc.orig	2016-09-19 11:05:01.000000000 +0000
+++ client/mysqlbinlog.cc
@@ -38,6 +38,9 @@
 #include "sql_common.h"
 #include "my_dir.h"
 #include <welcome_copyright_notice.h> // ORACLE_WELCOME_COPYRIGHT_NOTICE
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
 
 /**
    The function represents Log_event delete wrapper
