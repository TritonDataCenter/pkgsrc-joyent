$NetBSD$

--- src/listener/sqlrlistener.h.orig	2011-06-28 20:38:49.000000000 +0000
+++ src/listener/sqlrlistener.h
@@ -26,6 +26,8 @@
 
 #include <defines.h>
 
+#include <cstring>
+
 #ifdef RUDIMENTS_NAMESPACE
 using namespace rudiments;
 #endif
