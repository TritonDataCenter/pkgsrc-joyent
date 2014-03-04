$NetBSD$

Need the workaround on at least SunOS too.
--- src/libcollectdclient/network_buffer.c.orig	2013-08-18 10:24:25.073973439 +0000
+++ src/libcollectdclient/network_buffer.c
@@ -37,7 +37,7 @@
 
 #if HAVE_LIBGCRYPT
 # include <pthread.h>
-# if defined __APPLE__
+# if defined(__APPLE__) || defined(__sun)
 /* default xcode compiler throws warnings even when deprecated functionality
  * is not used. -Werror breaks the build because of erroneous warnings.
  * http://stackoverflow.com/questions/10556299/compiler-warnings-with-libgcrypt-v1-5-0/12830209#12830209
@@ -50,7 +50,7 @@
  */
 # define GCRYPT_NO_DEPRECATED
 # include <gcrypt.h>
-# if defined __APPLE__
+# if defined(__APPLE__) || defined(__sun)
 /* Re enable deprecation warnings */
 #  pragma GCC diagnostic warning "-Wdeprecated-declarations"
 # endif
