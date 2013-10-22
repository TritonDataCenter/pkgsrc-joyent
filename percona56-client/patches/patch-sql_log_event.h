$NetBSD: patch-sql_log_event.h,v 1.2 2013/04/20 08:06:01 adam Exp $

* Portability: include <bstring.h> if exists.

--- sql/log_event.h.orig	2013-04-05 12:27:18.000000000 +0000
+++ sql/log_event.h
@@ -28,6 +28,10 @@
 #ifndef _log_event_h
 #define _log_event_h
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 #include <my_bitmap.h>
 #include "rpl_constants.h"
 #include "table_id.h"
