$NetBSD$

Support SunOS/gcc.

--- jdk/src/java.desktop/share/native/libsplashscreen/libpng/pngpriv.h.orig	2019-01-07 08:01:59.000000000 +0000
+++ jdk/src/java.desktop/share/native/libsplashscreen/libpng/pngpriv.h
@@ -63,7 +63,9 @@
  * Windows/Visual Studio) there is no effect; the OS specific tests below are
  * still required (as of 2011-05-02.)
  */
+#if (!defined(__sun) || (__STDC_VERSION__-0 < 199901L)) && !defined(_POSIX_SOURCE)
 #define _POSIX_SOURCE 1 /* Just the POSIX 1003.1 and C89 APIs */
+#endif
 
 #ifndef PNG_VERSION_INFO_ONLY
 /* Standard library headers not required by png.h: */
