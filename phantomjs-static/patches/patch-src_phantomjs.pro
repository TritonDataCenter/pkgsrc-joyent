$NetBSD$

Fix plugin linking.
--- src/phantomjs.pro.orig	2014-10-23 04:27:58.000000000 +0000
+++ src/phantomjs.pro
@@ -131,3 +131,22 @@ win32-msvc* {
             qico
     }
 }
+
+solaris* {
+    QMAKE_LFLAGS += -static-libgcc -static-libstdc++
+    LIBS += -lnsl -lsocket
+
+    QTPLUGIN += \
+    qcncodecs \
+    qjpcodecs \
+    qkrcodecs \
+    qtwcodecs
+}
+
+netbsd* {
+    QTPLUGIN += \
+    qcncodecs \
+    qjpcodecs \
+    qkrcodecs \
+    qtwcodecs
+}
