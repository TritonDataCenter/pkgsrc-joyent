$NetBSD: patch-sql_log_event.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

* Portability: include <bstring.h> if exists.

--- sql/log_event.cc.orig	2013-01-07 06:29:49.000000000 +0000
+++ sql/log_event.cc
@@ -47,6 +47,10 @@
 #include <my_dir.h>
 #include "sql_show.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bcmp() */
+#endif
+
 #endif /* MYSQL_CLIENT */
 
 #include <base64.h>
