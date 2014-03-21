$NetBSD$

Fixes at least SunOS.
--- src/mongo/base/initializer.h.orig	2014-03-05 22:34:28.000000000 +0000
+++ src/mongo/base/initializer.h
@@ -17,6 +17,7 @@
 
 #include <string>
 #include <vector>
+#include <unistd.h>
 
 #include "mongo/base/disallow_copying.h"
 #include "mongo/base/initializer_context.h"
