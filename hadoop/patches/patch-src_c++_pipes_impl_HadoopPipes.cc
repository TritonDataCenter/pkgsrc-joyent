$NetBSD$

Needs unistd for GCC 4.7.
--- src/c++/pipes/impl/HadoopPipes.cc.orig	2012-05-08 20:34:52.000000000 +0000
+++ src/c++/pipes/impl/HadoopPipes.cc
@@ -34,6 +34,7 @@
 #include <pthread.h>
 #include <iostream>
 #include <fstream>
+#include <unistd.h>
 
 #include <openssl/hmac.h>
 #include <openssl/buffer.h>
