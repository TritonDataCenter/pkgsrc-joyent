$NetBSD$

Include unistd.h for isatty().

--- qpress.cpp.orig	2025-05-21 09:27:26.546202605 +0000
+++ qpress.cpp
@@ -92,6 +92,7 @@ and finally outputs an UPDIR:
 #include "aio.hpp"
 #include <stdarg.h>
 #include <string>
+#include <unistd.h>
 #include "levels.c"
 #include "utilities.hpp"
 
