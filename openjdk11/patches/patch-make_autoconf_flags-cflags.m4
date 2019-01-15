$NetBSD$

Support for SunOS/gcc.

--- make/autoconf/flags-cflags.m4.orig	2019-01-08 09:40:27.000000000 +0000
+++ make/autoconf/flags-cflags.m4
@@ -41,8 +41,13 @@ AC_DEFUN([FLAGS_SETUP_SHARED_LIBS],
     SHARED_LIBRARY_FLAGS='-shared'
     SET_EXECUTABLE_ORIGIN='-Wl,-rpath,\$$ORIGIN[$]1'
     SET_SHARED_LIBRARY_ORIGIN="-Wl,-z,origin $SET_EXECUTABLE_ORIGIN"
+   if test "x$OPENJDK_TARGET_OS" = xsolaris; then
+    SET_SHARED_LIBRARY_NAME='-Wl,-h,[$]1'
+    SET_SHARED_LIBRARY_MAPFILE='-Wl,-M,[$]1'
+   else
     SET_SHARED_LIBRARY_NAME='-Wl,-soname=[$]1'
     SET_SHARED_LIBRARY_MAPFILE='-Wl,-version-script=[$]1'
+   fi
 
   elif test "x$TOOLCHAIN_TYPE" = xclang; then
     C_FLAG_REORDER=''
@@ -387,8 +392,8 @@ AC_DEFUN([FLAGS_SETUP_CFLAGS_HELPER],
     CFLAGS_OS_DEF_JVM="-DLINUX"
     CFLAGS_OS_DEF_JDK="-D_GNU_SOURCE -D_REENTRANT -D_LARGEFILE64_SOURCE"
   elif test "x$OPENJDK_TARGET_OS" = xsolaris; then
-    CFLAGS_OS_DEF_JVM="-DSOLARIS"
-    CFLAGS_OS_DEF_JDK="-D__solaris__"
+    CFLAGS_OS_DEF_JVM="-DSOLARIS -D_LARGEFILE64_SOURCE"
+    CFLAGS_OS_DEF_JDK="-D__solaris__ -D_LARGEFILE64_SOURCE"
   elif test "x$OPENJDK_TARGET_OS" = xmacosx; then
     CFLAGS_OS_DEF_JVM="-D_ALLBSD_SOURCE -D_DARWIN_C_SOURCE -D_XOPEN_SOURCE"
     CFLAGS_OS_DEF_JDK="-D_ALLBSD_SOURCE -D_DARWIN_UNLIMITED_SELECT"
