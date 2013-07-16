$NetBSD: patch-sql_log_event.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

* Portability: include <bstring.h> if exists.

--- sql/log_event.cc.orig	2013-06-20 21:05:04.000000000 +0000
+++ sql/log_event.cc
@@ -47,6 +47,10 @@
 #include <my_dir.h>
 #include "sql_show.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bcmp() */
+#endif
+
 #if WITH_WSREP
 #include "wsrep_mysqld.h"
 #endif
