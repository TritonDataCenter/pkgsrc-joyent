$NetBSD$

--- make/autoconf/flags-ldflags.m4.orig	2020-07-07 16:55:29.000000000 +0000
+++ make/autoconf/flags-ldflags.m4
@@ -71,7 +71,11 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
 
     # Add -z defs, to forbid undefined symbols in object files.
     # add relro (mark relocations read only) for all libs
+   if test "x$OPENJDK_TARGET_OS" = xsolaris; then
+    BASIC_LDFLAGS_JVM_ONLY="-Wl,-O1"
+   else
     BASIC_LDFLAGS="$BASIC_LDFLAGS -Wl,-z,defs -Wl,-z,relro"
+   fi
     BASIC_LDFLAGS_JVM_ONLY="-Wl,-O1"
 
   elif test "x$TOOLCHAIN_TYPE" = xclang; then
@@ -145,12 +149,14 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
 
   # Setup LDFLAGS for linking executables
   if test "x$TOOLCHAIN_TYPE" = xgcc; then
+   if test "x$OPENJDK_TARGET_OS" != xsolaris; then
     EXECUTABLE_LDFLAGS="$EXECUTABLE_LDFLAGS -Wl,--allow-shlib-undefined"
     # Enabling pie on 32 bit builds prevents the JVM from allocating a continuous
     # java heap.
     if test "x$OPENJDK_TARGET_CPU_BITS" != "x32"; then
       EXECUTABLE_LDFLAGS="$EXECUTABLE_LDFLAGS -pie"
     fi
+   fi
   fi
 
   if test "x$ALLOW_ABSOLUTE_PATHS_IN_OUTPUT" = "xfalse"; then
