$NetBSD: patch-client_sql_string.cc,v 1.2 2012/10/01 15:54:40 adam Exp $

* Portability: include <bstring.h> if exists.

--- client/sql_string.cc.orig	2014-09-05 08:16:57.000000000 +0000
+++ client/sql_string.cc
@@ -29,6 +29,10 @@
 
 #include "sql_string.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 /*****************************************************************************
 ** String functions
 *****************************************************************************/
