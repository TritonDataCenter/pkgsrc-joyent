$NetBSD$

Include unistd.h for isatty().

--- qpress.cpp.orig	2010-09-23 19:09:26.000000000 +0000
+++ qpress.cpp
@@ -89,6 +89,7 @@ and finally outputs an UPDIR:
 #include <sys/stat.h>
 #include <stdlib.h>
 #include <stdio.h>
+#include <unistd.h>
 #include "aio.hpp"
 #include <stdarg.h>
 #include <string>
