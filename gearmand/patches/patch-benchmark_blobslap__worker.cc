$NetBSD$

Need unistd.h for unlink(2).

--- benchmark/blobslap_worker.cc.orig	2013-02-01 20:23:35.000000000 +0000
+++ benchmark/blobslap_worker.cc
@@ -55,6 +55,7 @@
 #include "util/pidfile.hpp"
 #include "util/signal.hpp"
 #include "util/string.hpp"
+#include <unistd.h>
 
 using namespace datadifferential;
 
