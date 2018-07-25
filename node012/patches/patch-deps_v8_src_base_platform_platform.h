$NetBSD$

Fix C99 build.

--- deps/v8/src/base/platform/platform.h.orig	2016-12-21 12:14:28.000000000 +0000
+++ deps/v8/src/base/platform/platform.h
@@ -30,7 +30,7 @@
 #include "src/base/platform/semaphore.h"
 
 #ifdef __sun
-# ifndef signbit
+# if !defined(signbit) && (__STDC_VERSION__-0 < 199901L)
 namespace std {
 int signbit(double x);
 }
