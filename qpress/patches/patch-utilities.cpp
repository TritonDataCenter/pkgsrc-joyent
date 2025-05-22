$NetBSD$

Include unistd.h for yield().

--- utilities.cpp.orig	2025-05-21 09:27:39.436951308 +0000
+++ utilities.cpp
@@ -4,6 +4,7 @@
 #include <string.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <unistd.h>
 #include "utilities.hpp"
 
 #ifdef WINDOWS
