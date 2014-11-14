$NetBSD: patch-src_3rdparty_webkit_Source_JavaScriptCore_wtf_StringImpl.h,v 1.1 2012/07/25 11:40:50 fhajny Exp $

Fix for GCC 4.7.
Port over from x11/qt4-libs.
--- src/qt/src/3rdparty/webkit/Source/JavaScriptCore/wtf/text/StringImpl.h.orig	2014-10-23 04:27:58.000000000 +0000
+++ src/qt/src/3rdparty/webkit/Source/JavaScriptCore/wtf/text/StringImpl.h
@@ -24,6 +24,7 @@
 #define StringImpl_h
 
 #include <limits.h>
+#include <unistd.h>
 #include <wtf/ASCIICType.h>
 #include <wtf/CrossThreadRefCounted.h>
 #include <wtf/Forward.h>
