$NetBSD$

Support SunOS/gcc.

--- make/autoconf/libraries.m4.orig	2020-05-13 14:18:16.000000000 +0000
+++ make/autoconf/libraries.m4
@@ -197,6 +197,7 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
 AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT],
 [
   if test "x$OPENJDK_TARGET_OS" = "xsolaris"; then
+   if test "$TOOLCHAIN_TYPE" = "solstudio"; then
     # Find the root of the Solaris Studio installation from the compiler path
     SOLARIS_STUDIO_DIR="$(dirname $CC)/.."
     STLPORT_LIB="$SOLARIS_STUDIO_DIR/lib/stlport4$OPENJDK_TARGET_CPU_ISADIR/libstlport.so.1"
@@ -212,5 +213,6 @@ AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT
       AC_MSG_RESULT([no, not found at $STLPORT_LIB, cannot build Hotspot gtests])
     fi
     AC_SUBST(STLPORT_LIB)
+   fi
   fi
 ])
