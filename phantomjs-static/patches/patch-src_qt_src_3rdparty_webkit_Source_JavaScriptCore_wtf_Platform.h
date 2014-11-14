$NetBSD$

Fix build on SunOS.
--- src/qt/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h.orig	2014-10-23 04:27:58.000000000 +0000
+++ src/qt/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
@@ -445,6 +445,7 @@
 /* OS(SOLARIS) - Solaris */
 #if defined(sun) || defined(__sun)
 #define WTF_OS_SOLARIS 1
+#define USE_SYSTEM_MALLOC 1
 #endif
 
 /* OS(WINCE) - Windows CE; note that for this platform OS(WINDOWS) is also defined */
