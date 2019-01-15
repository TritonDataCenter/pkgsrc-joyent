$NetBSD$

Support SunOS/gcc.

--- make/autoconf/flags-ldflags.m4.orig	2019-01-08 09:40:27.000000000 +0000
+++ make/autoconf/flags-ldflags.m4
@@ -74,10 +74,12 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
     # Add -z defs, to forbid undefined symbols in object files.
     BASIC_LDFLAGS="$BASIC_LDFLAGS -Wl,-z,defs"
 
+   if test "x$OPENJDK_TARGET_OS" != xsolaris; then
     BASIC_LDFLAGS_JVM_ONLY="-Wl,-z,noexecstack -Wl,-O1 -Wl,-z,relro"
 
     BASIC_LDFLAGS_JDK_LIB_ONLY="-Wl,-z,noexecstack"
     LIBJSIG_NOEXECSTACK_LDFLAGS="-Wl,-z,noexecstack"
+   fi
 
   elif test "x$TOOLCHAIN_TYPE" = xclang; then
     BASIC_LDFLAGS_JVM_ONLY="-mno-omit-leaf-frame-pointer -mstack-alignment=16 \
@@ -139,7 +141,9 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
 
   # Setup LDFLAGS for linking executables
   if test "x$TOOLCHAIN_TYPE" = xgcc; then
+   if test "x$OPENJDK_TARGET_OS" != xsolaris; then
     EXECUTABLE_LDFLAGS="$EXECUTABLE_LDFLAGS -Wl,--allow-shlib-undefined"
+   fi
   fi
 
   # Export some intermediate variables for compatibility
