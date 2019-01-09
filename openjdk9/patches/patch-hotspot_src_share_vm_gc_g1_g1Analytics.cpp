$NetBSD$

Similar issue to https://bugs.openjdk.java.net/browse/JDK-8193056

--- hotspot/src/share/vm/gc/g1/g1Analytics.cpp.orig	2019-01-07 07:58:06.000000000 +0000
+++ hotspot/src/share/vm/gc/g1/g1Analytics.cpp
@@ -23,6 +23,7 @@
  */
 
 #include "precompiled.hpp"
+#include "memory/allocation.inline.hpp"
 #include "gc/g1/g1Analytics.hpp"
 #include "gc/g1/g1Predictions.hpp"
 #include "runtime/os.hpp"
