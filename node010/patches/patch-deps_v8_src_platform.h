$NetBSD$

Fix C99 build.

--- deps/v8/src/platform.h.orig	2016-10-18 13:32:51.000000000 +0000
+++ deps/v8/src/platform.h
@@ -45,7 +45,7 @@
 #define V8_PLATFORM_H_
 
 #ifdef __sun
-# ifndef signbit
+# if !defined(signbit) && (__STDC_VERSION__-0 < 199901L)
 int signbit(double x);
 # endif
 #endif
