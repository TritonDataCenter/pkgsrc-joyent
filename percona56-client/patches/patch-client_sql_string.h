$NetBSD: patch-client_sql_string.h,v 1.1 2013/02/13 21:00:03 adam Exp $

Portability: include <bstring.h> if exists.

--- client/sql_string.h.orig	2013-06-26 20:38:20.000000000 +0000
+++ client/sql_string.h
@@ -21,6 +21,10 @@
 #include "m_ctype.h"
 #include "my_sys.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 #define QUOTED_IDENTIFIER(str_name, buf_size, q, cs, id_name, id_size) \
 	char buf_##str_name[(buf_size)]; \
 	String str_name((buf_##str_name), (buf_size), (cs)); \
