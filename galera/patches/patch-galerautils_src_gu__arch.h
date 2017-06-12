$NetBSD$

SunOS does have endian.h, but actually sys/byteorder.h is required instead.

--- galerautils/src/gu_arch.h.orig	2017-05-31 07:19:41.000000000 +0000
+++ galerautils/src/gu_arch.h
@@ -9,7 +9,7 @@
 #ifndef _gu_arch_h_
 #define _gu_arch_h_
 
-#if defined(HAVE_ENDIAN_H)
+#if defined(HAVE_ENDIAN_H) && !defined(__sun)
 # include <endian.h>
 #elif defined(HAVE_SYS_ENDIAN_H) /* FreeBSD */
 # include <sys/endian.h>
