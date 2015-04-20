$NetBSD$

Fixes at least SunOS.
--- src/mongo/base/initializer.h.orig	2015-04-08 20:28:08.000000000 +0000
+++ src/mongo/base/initializer.h
@@ -29,6 +29,7 @@
 
 #include <string>
 #include <vector>
+#include <unistd.h>
 
 #include "mongo/base/disallow_copying.h"
 #include "mongo/base/initializer_context.h"
