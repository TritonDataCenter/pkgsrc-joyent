$NetBSD$

Add support for NetBSD.
--- src/mongo/util/file_allocator.cpp.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/util/file_allocator.cpp
@@ -22,7 +22,7 @@
 #include <fcntl.h>
 #include <errno.h>
 
-#if defined(__freebsd__) || defined(__openbsd__)
+#if defined(__freebsd__) || defined(__netbsd__) || defined(__openbsd__)
 #   include <sys/stat.h>
 #endif
 
