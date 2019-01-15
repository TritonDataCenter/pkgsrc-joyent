$NetBSD$

Avoid GCC flags leaking into GNU as.

--- make/autoconf/flags-other.m4.orig	2019-01-08 09:40:28.000000000 +0000
+++ make/autoconf/flags-other.m4
@@ -119,7 +119,7 @@ AC_DEFUN([FLAGS_SETUP_ASFLAGS],
 AC_DEFUN([FLAGS_SETUP_ASFLAGS_CPU_DEP],
 [
   # Misuse EXTRA_CFLAGS to mimic old behavior
-  $2JVM_ASFLAGS="$JVM_BASIC_ASFLAGS ${$2EXTRA_CFLAGS}"
+  #$2JVM_ASFLAGS="$JVM_BASIC_ASFLAGS ${$2EXTRA_CFLAGS}"
 
   AC_SUBST($2JVM_ASFLAGS)
 ])
