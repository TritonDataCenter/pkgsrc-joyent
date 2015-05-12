$NetBSD$

Don't redefine strerror.

--- storage/connect/filamvct.cpp.orig	2015-02-25 15:40:55.000000000 +0000
+++ storage/connect/filamvct.cpp
@@ -65,7 +65,7 @@
 extern int num_read, num_there;                          // Statistics
 static int num_write;
 
-#if defined(UNIX)
+#if defined(UNIX) && !defined(__sun)
 // Add dummy strerror  (NGC)
 char *strerror(int num);
 #endif   // UNIX
