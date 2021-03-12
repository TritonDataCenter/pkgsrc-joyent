$NetBSD$

Switch to GCC demangler, from Tribblix.

--- src/hotspot/os/solaris/decoder_solaris.cpp.orig	2020-07-29 16:52:13.000000000 +0000
+++ src/hotspot/os/solaris/decoder_solaris.cpp
@@ -24,9 +24,21 @@
 
 #include "utilities/decoder_elf.hpp"
 
-#include <demangle.h>
+#include <cxxabi.h>
 
 bool ElfDecoder::demangle(const char* symbol, char *buf, int buflen) {
-  return !cplus_demangle(symbol, buf, (size_t)buflen);
+  int   status;
+  char* result;
+  size_t size = (size_t)buflen;
+  // Don't pass buf to __cxa_demangle. In case of the 'buf' is too small,
+  // __cxa_demangle will call system "realloc" for additional memory, which
+  // may use different malloc/realloc mechanism that allocates 'buf'.
+  if ((result = abi::__cxa_demangle(symbol, NULL, NULL, &status)) != NULL) {
+    jio_snprintf(buf, buflen, "%s", result);
+      // call c library's free
+      ::free(result);
+      return true;
+  }
+  return false;
 }
 
