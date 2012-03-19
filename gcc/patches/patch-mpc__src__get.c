$NetBSD$

--- mpc/src/get.c.orig	2011-10-05 06:52:24.562883230 +0000
+++ mpc/src/get.c
@@ -23,6 +23,10 @@ MA 02111-1307, USA. */
 
 #if HAVE_COMPLEX_H
 # include <complex.h>
+# if defined(sun) && defined(__GNUC__)
+#  undef I
+#  define I (__extension__ 1.0iF)
+# endif
 #endif
 
 #include "mpc-impl.h"
