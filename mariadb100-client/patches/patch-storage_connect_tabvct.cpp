$NetBSD$

Don't redefine strerror.

--- storage/connect/tabvct.cpp.orig	2015-02-25 15:40:55.000000000 +0000
+++ storage/connect/tabvct.cpp
@@ -71,7 +71,7 @@
 #include "tabvct.h"
 #include "valblk.h"
 
-#if defined(UNIX)
+#if defined(UNIX) && !defined(__sun)
 //add dummy strerror   (NGC)
 char *strerror(int num);
 #endif   // UNIX
