$NetBSD: patch-src_3rdparty_webkit_Source_JavaScriptCore_wtf_MathExtras.h,v 1.2 2012/04/09 09:12:49 adam Exp $

Port over from x11/qt4-libs.
--- src/qt/src/3rdparty/webkit/Source/JavaScriptCore/wtf/MathExtras.h.orig	2014-10-23 04:27:58.000000000 +0000
+++ src/qt/src/3rdparty/webkit/Source/JavaScriptCore/wtf/MathExtras.h
@@ -252,7 +252,7 @@ inline int clampToInteger(unsigned value
     return static_cast<int>(std::min(value, static_cast<unsigned>(std::numeric_limits<int>::max())));
 }
 
-#if !COMPILER(MSVC) && !(COMPILER(RVCT) && PLATFORM(BREWMP)) && !OS(SOLARIS) && !OS(SYMBIAN)
+#if !COMPILER(MSVC) && !(COMPILER(RVCT) && PLATFORM(BREWMP)) && !(OS(SOLARIS) && COMPILER(GCC) && (GCC_VERSION < 40600)) && !OS(SYMBIAN)
 using std::isfinite;
 using std::isinf;
 using std::isnan;
