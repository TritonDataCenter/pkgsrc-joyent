$NetBSD$

Fix C99 build.

--- deps/v8/src/platform-solaris.cc.orig	2016-10-18 13:32:51.000000000 +0000
+++ deps/v8/src/platform-solaris.cc
@@ -61,7 +61,7 @@
 // It seems there is a bug in some Solaris distributions (experienced in
 // SunOS 5.10 Generic_141445-09) which make it difficult or impossible to
 // access signbit() despite the availability of other C99 math functions.
-#ifndef signbit
+#if !defined(signbit) && (__STDC_VERSION__-0 < 199901L)
 // Test sign - usually defined in math.h
 int signbit(double x) {
   // We need to take care of the special case of both positive and negative
