$NetBSD$

Convert build to static.
--- src/qt/src/gui/kernel/kernel.pri.orig	2014-10-23 04:27:58.000000000 +0000
+++ src/qt/src/gui/kernel/kernel.pri
@@ -286,7 +286,7 @@ unix:qpa {
     # pull in the proper freetype2 include directory
     include($$QT_SOURCE_TREE/config.tests/unix/freetype/freetype.pri)
 
-    LIBS_PRIVATE += -lfreetype -lfontconfig
+    LIBS_PRIVATE += -Wl,-Bstatic -lfontconfig -lfreetype -lexpat -lbz2 -Wl,-Bdynamic
 }
 
 !embedded:!qpa:!x11:mac {
