$NetBSD$

Support SunOS/gcc. XXX!

--- jdk/src/jdk.crypto.ec/share/native/libsunec/ECC_JNI.cpp.orig	2019-01-07 08:02:00.000000000 +0000
+++ jdk/src/jdk.crypto.ec/share/native/libsunec/ECC_JNI.cpp
@@ -36,6 +36,8 @@
 
 extern "C" {
 
+#define B_TRUE	_B_TRUE
+#define B_FALSE	_B_FALSE
 /*
  * Declare library specific JNI_Onload entry if static build
  */
