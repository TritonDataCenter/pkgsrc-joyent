$NetBSD$

Support SunOS/gcc.

--- make/autoconf/libraries.m4.orig	2020-07-29 16:52:13.000000000 +0000
+++ make/autoconf/libraries.m4
@@ -136,7 +136,7 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
   fi
 
   if test "x$OPENJDK_TARGET_OS" = xsolaris; then
-    BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lsocket -lsched -ldoor -ldemangle -lnsl \
+    BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lsocket -lsched -ldoor -lnsl \
         -lrt -lkstat"
     BASIC_JVM_LIBS="$BASIC_JVM_LIBS $LIBCXX_JVM"
   fi
@@ -204,6 +204,7 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
 AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT],
 [
   if test "$OPENJDK_TARGET_OS" = "solaris" && test "x$BUILD_GTEST" = "xtrue"; then
+   if test "$TOOLCHAIN_TYPE" = "solstudio"; then
     # Find the root of the Solaris Studio installation from the compiler path
     SOLARIS_STUDIO_DIR="$(dirname $CC)/.."
     STLPORT_LIB="$SOLARIS_STUDIO_DIR/lib/stlport4$OPENJDK_TARGET_CPU_ISADIR/libstlport.so.1"
@@ -220,6 +221,7 @@ AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT
       AC_MSG_ERROR([Failed to find libstlport.so.1, cannot build Hotspot gtests])
     fi
     AC_SUBST(STLPORT_LIB)
+   fi
   fi
 ])
 
