$NetBSD$

Support SunOS/gcc.

--- make/autoconf/flags-ldflags.m4.orig	2020-07-07 16:55:29.000000000 +0000
+++ make/autoconf/flags-ldflags.m4
@@ -72,9 +72,13 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
     fi
 
     # Add -z defs, to forbid undefined symbols in object files.
+    if test "x$OPENJDK_TARGET_OS" = xsolaris; then
+      BASIC_LDFLAGS="$BASIC_LDFLAGS -Wl,-z,defs"
+    else
     # add -z,relro (mark relocations read only) for all libs
     # add -z,now ("full relro" - more of the Global Offset Table GOT is marked read only)
     BASIC_LDFLAGS="$BASIC_LDFLAGS -Wl,-z,defs -Wl,-z,relro -Wl,-z,now"
+    fi
     # s390x : remove unused code+data in link step
     if test "x$OPENJDK_TARGET_CPU" = xs390x; then
       BASIC_LDFLAGS="$BASIC_LDFLAGS -Wl,--gc-sections -Wl,--print-gc-sections"
@@ -141,12 +145,14 @@ AC_DEFUN([FLAGS_SETUP_LDFLAGS_HELPER],
 
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
