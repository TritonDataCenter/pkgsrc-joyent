$NetBSD$

No error.h here.
--- src/c++/libhdfs/hdfsJniHelper.c.orig	2012-05-08 20:34:53.000000000 +0000
+++ src/c++/libhdfs/hdfsJniHelper.c
@@ -15,7 +15,9 @@
  */
 
 #include <string.h> 
-#include <error.h>
+#if !defined(__sun)
+# include <error.h>
+#endif
 #include "hdfsJniHelper.h"
 
 static pthread_mutex_t hdfsHashMutex = PTHREAD_MUTEX_INITIALIZER;
