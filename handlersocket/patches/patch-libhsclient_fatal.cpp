$NetBSD$

* Upstream patch.

--- libhsclient/fatal.cpp.orig	2012-05-01 12:09:31.000000000 +0000
+++ libhsclient/fatal.cpp
@@ -9,6 +9,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <syslog.h>
+#include <unistd.h>
 
 #include "fatal.hpp"
 
