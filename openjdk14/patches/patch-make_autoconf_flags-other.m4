$NetBSD$

--- make/autoconf/flags-other.m4.orig	2019-07-16 16:38:28.000000000 +0000
+++ make/autoconf/flags-other.m4
@@ -117,7 +117,7 @@ AC_DEFUN([FLAGS_SETUP_ASFLAGS],
 AC_DEFUN([FLAGS_SETUP_ASFLAGS_CPU_DEP],
 [
   # Misuse EXTRA_CFLAGS to mimic old behavior
-  $2JVM_ASFLAGS="$JVM_BASIC_ASFLAGS ${$2EXTRA_CFLAGS}"
+  #$2JVM_ASFLAGS="$JVM_BASIC_ASFLAGS ${$2EXTRA_CFLAGS}"
 
   if test "x$1" = "xTARGET" && \
       test "x$TOOLCHAIN_TYPE" = xgcc && \
