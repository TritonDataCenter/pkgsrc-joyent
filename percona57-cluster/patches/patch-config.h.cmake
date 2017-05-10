$NetBSD$

libwrap patch from https://bugs.mysql.com/bug.php?id=84495

--- config.h.cmake.orig	2017-04-12 09:57:48.000000000 +0000
+++ config.h.cmake
@@ -30,6 +30,7 @@
 #cmakedefine HAVE_LIBDL 1
 #cmakedefine HAVE_LIBRT 1
 #cmakedefine HAVE_LIBWRAP 1
+#cmakedefine HAVE_LIBWRAP_PROTOTYPES 1
 
 /* Header files */
 #cmakedefine HAVE_ALLOCA_H 1
