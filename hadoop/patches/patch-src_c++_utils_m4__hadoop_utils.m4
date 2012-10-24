$NetBSD$

HMAC_Init is in libcrypto, not libssl.
--- src/c++/utils/m4/hadoop_utils.m4.orig	2012-05-08 20:34:52.000000000 +0000
+++ src/c++/utils/m4/hadoop_utils.m4
@@ -51,8 +51,8 @@ AC_CHECK_HEADERS([pthread.h], [],
   AC_MSG_ERROR(Please check if you have installed the pthread library)) 
 AC_CHECK_LIB([pthread], [pthread_create], [], 
   AC_MSG_ERROR(Cannot find libpthread.so, please check))
-AC_CHECK_LIB([ssl], [HMAC_Init], [], 
-  AC_MSG_ERROR(Cannot find libssl.so, please check))
+AC_CHECK_LIB([crypto], [HMAC_Init], [], 
+  AC_MSG_ERROR(Cannot find libcrypto.so, please check))
 ])
 
 # define a macro for using hadoop pipes
