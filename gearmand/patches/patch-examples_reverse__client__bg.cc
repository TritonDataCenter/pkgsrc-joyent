$NetBSD$

Need unistd.h for STDOUT_FILENO.

--- examples/reverse_client_bg.cc.orig	2013-02-01 20:23:35.000000000 +0000
+++ examples/reverse_client_bg.cc
@@ -43,6 +43,7 @@
 #include <iomanip>
 #include <iostream>
 #include <string>
+#include <unistd.h>
 
 #include <libgearman/gearman.h>
 #include <boost/program_options.hpp>
