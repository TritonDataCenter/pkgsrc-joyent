$NetBSD: patch-sql_sql_string.h,v 1.2 2013/04/29 21:16:57 joerg Exp $

Portability: include <bstring.h> if exists.

--- sql/sql_string.h.orig	2013-04-05 12:27:18.000000000 +0000
+++ sql/sql_string.h
@@ -22,6 +22,9 @@
 #include "my_sys.h"              /* alloc_root, my_free, my_realloc */
 #include "m_string.h"                           /* TRASH */
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
 
 /**
   A wrapper class for null-terminated constant strings.
