$NetBSD$

Need netinet/in.h.

--- modules/afsocket/socket-options-inet.c.orig	2014-12-15 14:48:45.000000000 +0000
+++ modules/afsocket/socket-options-inet.c
@@ -25,6 +25,7 @@
 #include "messages.h"
 
 #include <string.h>
+#include <netinet/in.h>
 
 #ifndef SOL_IP
 #define SOL_IP IPPROTO_IP
