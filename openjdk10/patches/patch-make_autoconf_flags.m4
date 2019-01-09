$NetBSD$

Support SunOS/gcc.

--- make/autoconf/flags.m4.orig	2019-01-08 12:44:54.000000000 +0000
+++ make/autoconf/flags.m4
@@ -359,6 +359,12 @@ AC_DEFUN([FLAGS_SETUP_COMPILER_FLAGS_FOR
       SET_SHARED_LIBRARY_ORIGIN="$SET_EXECUTABLE_ORIGIN"
       SET_SHARED_LIBRARY_NAME='-Wl,-install_name,@rpath/[$]1'
       SET_SHARED_LIBRARY_MAPFILE='-Wl,-exported_symbols_list,[$]1'
+    elif test "x$OPENJDK_TARGET_OS" = xsolaris; then
+      SHARED_LIBRARY_FLAGS='-shared'
+      SET_EXECUTABLE_ORIGIN='-Wl,-rpath,\$$ORIGIN[$]1'
+      SET_SHARED_LIBRARY_ORIGIN="-Wl,-z,origin $SET_EXECUTABLE_ORIGIN"
+      SET_SHARED_LIBRARY_NAME='-Wl,-h,[$]1'
+      SET_SHARED_LIBRARY_MAPFILE='-Wl,-M,[$]1'
     else
       # Default works for linux, might work on other platforms as well.
       SHARED_LIBRARY_FLAGS='-shared'
@@ -1016,8 +1022,12 @@ AC_DEFUN([FLAGS_SETUP_COMPILER_FLAGS_FOR
         -fvisibility=hidden -fno-strict-aliasing -fno-omit-frame-pointer"
   elif test "x$OPENJDK_$1_OS" = xsolaris; then
     $2JVM_CFLAGS="[$]$2JVM_CFLAGS -DSOLARIS"
+   if test "x$TOOLCHAIN_TYPE" = xsolstudio; then
     $2JVM_CFLAGS="[$]$2JVM_CFLAGS -template=no%extdef -features=no%split_init \
         -D_Crun_inline_placement -library=stlport4 $PICFLAG -mt -features=no%except"
+   else
+    $2JVM_CFLAGS="[$]$2JVM_CFLAGS $PICFLAG"
+   fi
   elif test "x$OPENJDK_$1_OS" = xmacosx; then
     $2COMMON_CCXXFLAGS_JDK="[$]$2COMMON_CCXXFLAGS_JDK -D_ALLBSD_SOURCE -D_DARWIN_UNLIMITED_SELECT"
     $2JVM_CFLAGS="[$]$2JVM_CFLAGS -D_ALLBSD_SOURCE"
@@ -1360,8 +1370,11 @@ $2LDFLAGS_JDKLIB="${$2LDFLAGS_JDKLIB} ${
     elif test "x$OPENJDK_$1_CPU" = xsparcv9; then
       $2SOLARIS_LIBM_LIBS="/usr/lib/sparcv9/libm.so.1"
     fi
-    $2JVM_LIBS="[$]$2JVM_LIBS -lsocket -lsched -ldl $SOLARIS_LIBM_LIBS -lCrun \
+    $2JVM_LIBS="[$]$2JVM_LIBS -lsocket -lsched -ldl $SOLARIS_LIBM_LIBS \
         -lthread -ldoor -lc -ldemangle -lnsl -lrt"
+   if test "x$TOOLCHAIN_TYPE" = xsolstudio; then
+    $2JVM_LIBS="[$]$2JVM_LIBS -lCrun"
+   fi
   elif test "x$OPENJDK_$1_OS" = xmacosx; then
     $2JVM_LIBS="[$]$2JVM_LIBS -lm"
   elif test "x$OPENJDK_$1_OS" = xaix; then
