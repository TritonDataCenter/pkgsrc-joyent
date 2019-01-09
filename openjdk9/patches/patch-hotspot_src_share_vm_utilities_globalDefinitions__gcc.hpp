$NetBSD$

Fix build on SunOS.

--- hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp.orig	2017-08-01 09:03:05.000000000 +0000
+++ hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
@@ -62,6 +62,7 @@
 #include <sys/procset.h>
 #include <ucontext.h>
 #include <setjmp.h>
+#include <inttypes.h>
 #endif // SOLARIS
 
 # ifdef SOLARIS_MUTATOR_LIBTHREAD
