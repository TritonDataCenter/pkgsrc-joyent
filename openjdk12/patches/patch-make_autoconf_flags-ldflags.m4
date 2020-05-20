$NetBSD$

--- make/autoconf/flags-ldflags.m4.orig	2019-07-16 16:38:28.000000000 +0000
+++ make/autoconf/flags-ldflags.m4
@@ -72,8 +72,11 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
     # Add -z defs, to forbid undefined symbols in object files.
     BASIC_LDFLAGS="$BASIC_LDFLAGS -Wl,-z,defs"
 
+   if test "x$OPENJDK_TARGET_OS" = xsolaris; then
+    BASIC_LDFLAGS_JVM_ONLY="-Wl,-O1"
+   else
     BASIC_LDFLAGS_JVM_ONLY="-Wl,-O1 -Wl,-z,relro"
-
+   fi
 
   elif test "x$TOOLCHAIN_TYPE" = xclang; then
     BASIC_LDFLAGS_JVM_ONLY="-mno-omit-leaf-frame-pointer -mstack-alignment=16 \
@@ -149,7 +152,9 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
 
   # Setup LDFLAGS for linking executables
   if test "x$TOOLCHAIN_TYPE" = xgcc; then
+   if test "x$OPENJDK_TARGET_OS" != xsolaris; then
     EXECUTABLE_LDFLAGS="$EXECUTABLE_LDFLAGS -Wl,--allow-shlib-undefined"
+   fi
   fi
 
   # Export some intermediate variables for compatibility
