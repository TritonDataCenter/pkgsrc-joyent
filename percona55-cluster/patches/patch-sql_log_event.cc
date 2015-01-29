$NetBSD: patch-sql_log_event.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

* Portability: include <bstring.h> if exists.

--- sql/log_event.cc.orig	2014-09-05 08:16:57.000000000 +0000
+++ sql/log_event.cc
@@ -48,6 +48,10 @@
 #include <my_dir.h>
 #include "sql_show.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bcmp() */
+#endif
+
 #if WITH_WSREP
 #include "wsrep_mysqld.h"
 #endif
