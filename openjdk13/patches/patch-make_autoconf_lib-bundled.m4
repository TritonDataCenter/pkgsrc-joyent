$NetBSD$

Ensure the correct zlib can be found.

--- make/autoconf/lib-bundled.m4.orig	2020-02-20 22:05:38.000000000 +0000
+++ make/autoconf/lib-bundled.m4
@@ -217,7 +217,7 @@ AC_DEFUN_ONCE([LIB_SETUP_ZLIB],
   if test "x$USE_EXTERNAL_LIBZ" = "xfalse"; then
     LIBZ_CFLAGS="$LIBZ_CFLAGS -I$TOPDIR/src/java.base/share/native/libzip/zlib"
   else
-    LIBZ_LIBS="-lz"
+    LIBZ_LIBS="-Wl,-R/opt/local/lib -L/opt/local/lib -lz"
   fi
 
   AC_SUBST(USE_EXTERNAL_LIBZ)
