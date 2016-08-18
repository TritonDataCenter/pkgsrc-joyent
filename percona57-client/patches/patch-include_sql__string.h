$NetBSD$

--- include/sql_string.h.orig	2016-03-28 18:06:12.000000000 +0000
+++ include/sql_string.h
@@ -29,6 +29,10 @@ extern PSI_memory_key key_memory_String_
 #define STRING_PSI_MEMORY_KEY PSI_NOT_INSTRUMENTED
 #endif
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 /**
   A wrapper class for null-terminated constant strings.
   Constructors make sure that the position of the '\0' terminating byte
