$NetBSD$

Support SunOS/gcc.

--- make/autoconf/platform.m4.orig	2019-01-08 12:44:55.000000000 +0000
+++ make/autoconf/platform.m4
@@ -577,7 +577,9 @@ AC_DEFUN([PLATFORM_SET_COMPILER_TARGET_B
 
   JVM_CFLAGS="$JVM_CFLAGS $ADDED_CFLAGS"
   JVM_LDFLAGS="$JVM_LDFLAGS $ADDED_LDFLAGS"
+ if test "x$TOOLCHAIN_TYPE" != xgcc; then
   JVM_ASFLAGS="$JVM_ASFLAGS $ADDED_CFLAGS"
+ fi
 ])
 
 AC_DEFUN_ONCE([PLATFORM_SETUP_OPENJDK_TARGET_BITS],
