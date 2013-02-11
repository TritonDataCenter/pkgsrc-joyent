$NetBSD$

* unistd.h required for yield()

--- utilities.cpp.orig	2009-12-29 17:50:38.000000000 +0000
+++ utilities.cpp
@@ -6,6 +6,7 @@
 #include <stdio.h>
 #include <stdarg.h>
 #include <stdlib.h>
+#include <unistd.h>
 #include "utilities.hpp"
 
 #ifdef WINDOWS
