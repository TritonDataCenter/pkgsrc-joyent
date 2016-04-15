$NetBSD$

Detect endianness on SunOS.
--- storage/tokudb/PerconaFT/portability/toku_htod.h.orig	2015-02-25 15:40:56.000000000 +0000
+++ storage/tokudb/PerconaFT/portability/toku_htod.h
@@ -116,6 +116,15 @@ PATENT RIGHTS GRANT:
 # define __BYTE_ORDER __DARWIN_BYTE_ORDER
 # define __LITTLE_ENDIAN __DARWIN_LITTLE_ENDIAN
 # define __BIG_ENDIAN __DARWIN_BIG_ENDIAN
+#elif defined(__sun)
+# include <sys/isa_defs.h>
+# define __BIG_ENDIAN 4321
+# define __LITTLE_ENDIAN 1234
+# if defined(_BIG_ENDIAN)
+#  define __BYTE_ORDER __BIG_ENDIAN
+# else
+#  define __BYTE_ORDER __LITTLE_ENDIAN
+# endif
 #endif
 #if !defined(__BYTE_ORDER) || \
     !defined(__LITTLE_ENDIAN) || \
