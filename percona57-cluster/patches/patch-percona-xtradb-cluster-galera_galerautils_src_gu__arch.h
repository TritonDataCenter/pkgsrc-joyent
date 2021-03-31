$NetBSD$

SunOS does have endian.h, but actually sys/byteorder.h is required instead.

--- percona-xtradb-cluster-galera/galerautils/src/gu_arch.h.orig	2019-06-20 05:19:58.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_arch.h
@@ -9,11 +9,11 @@
 #ifndef _gu_arch_h_
 #define _gu_arch_h_
 
-#if defined(HAVE_ENDIAN_H)
+#if defined(HAVE_ENDIAN_H) && !defined(__sun)
 # include <endian.h>
 #elif defined(HAVE_SYS_ENDIAN_H) /* FreeBSD */
 # include <sys/endian.h>
-#elif defined(HAVE_SYS_BYTEORDER_H)
+#elif defined(HAVE_SYS_BYTEORDER_H) || defined(__sun)
 # include <sys/byteorder.h>
 #elif defined(__APPLE__)
 # include <machine/endian.h>
