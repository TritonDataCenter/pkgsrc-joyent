$NetBSD$

Switch to GCC demangler, from Tribblix.

--- src/jdk.hotspot.agent/solaris/native/libsaproc/saproc.cpp.orig	2020-07-29 16:52:13.000000000 +0000
+++ src/jdk.hotspot.agent/solaris/native/libsaproc/saproc.cpp
@@ -27,7 +27,7 @@
 #include <thread_db.h>
 #include <strings.h>
 #include <limits.h>
-#include <demangle.h>
+#include <cxxabi.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <errno.h>
@@ -1221,8 +1221,13 @@ JNIEXPORT jstring JNICALL Java_sun_jvm_h
   CHECK_EXCEPTION_(NULL);
   char  buf[2*SYMBOL_BUF_SIZE + 1];
   jstring res = 0;
-  if (cplus_demangle((char*) ptr, buf, sizeof(buf)) != DEMANGLE_ESPACE) {
+  int   status;
+  char* result;
+  if ((result = abi::__cxa_demangle(ptr, NULL, NULL, &status)) != NULL) {
+    snprintf(buf, 2*SYMBOL_BUF_SIZE+1, "%s", result);
     res = env->NewStringUTF(buf);
+    // call c library's free
+    ::free(result);
   } else {
     res = name;
   }
