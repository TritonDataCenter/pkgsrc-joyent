$NetBSD: patch-sql_sql_string.cc,v 1.1.1.1 2011/04/25 21:12:53 adam Exp $

* Portability: include <bstring.h> if exists.

--- sql/sql_string.cc.orig	2010-02-04 11:39:53.000000000 +0000
+++ sql/sql_string.cc
@@ -27,6 +27,10 @@ extern void sql_element_free(void *ptr);
 
 #include "sql_string.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 /*****************************************************************************
 ** String functions
 *****************************************************************************/
