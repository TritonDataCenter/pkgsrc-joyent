$NetBSD$

Support SunOS/gcc.

--- common/autoconf/libraries.m4.orig	2017-07-27 18:04:46.000000000 +0000
+++ common/autoconf/libraries.m4
@@ -194,6 +194,7 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
 AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT],
 [
   if test "$OPENJDK_TARGET_OS" = "solaris" && test "x$BUILD_GTEST" = "xtrue"; then
+   if test "$TOOLCHAIN_TYPE" = "solstudio"; then
     # Find the root of the Solaris Studio installation from the compiler path
     SOLARIS_STUDIO_DIR="$(dirname $CC)/.."
     STLPORT_LIB="$SOLARIS_STUDIO_DIR/lib/stlport4$OPENJDK_TARGET_CPU_ISADIR/libstlport.so.1"
@@ -210,6 +211,7 @@ AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT
       AC_MSG_ERROR([Failed to find libstlport.so.1, cannot build Hotspot gtests])
     fi
     AC_SUBST(STLPORT_LIB)
+   fi
   fi
 ])
 
