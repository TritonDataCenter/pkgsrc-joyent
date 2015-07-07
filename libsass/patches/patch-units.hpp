$NetBSD$

Avoid SEC definition from <sys/time.h> on SunOS.

--- units.hpp.orig	2015-06-09 20:36:35.000000000 +0000
+++ units.hpp
@@ -5,6 +5,10 @@
 #include <string>
 #include <sstream>
 
+#ifdef __sun
+#undef SEC
+#endif
+
 namespace Sass {
   using namespace std;
 
