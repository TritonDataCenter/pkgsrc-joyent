$NetBSD: patch-client_sql_string.cc,v 1.3 2013/02/12 20:36:28 adam Exp $

Portability: include <bstring.h> if exists.

--- client/sql_string.cc.orig	2010-02-04 11:36:53.000000000 +0000
+++ client/sql_string.cc
@@ -29,6 +29,10 @@ extern void sql_element_free(void *ptr);
 
 #include "sql_string.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 /*****************************************************************************
 ** String functions
 *****************************************************************************/
