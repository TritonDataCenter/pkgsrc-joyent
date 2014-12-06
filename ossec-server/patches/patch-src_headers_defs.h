$NetBSD$

Change default location.
--- src/headers/defs.h.orig	2014-09-09 02:03:23.000000000 +0000
+++ src/headers/defs.h
@@ -98,7 +98,7 @@ http://www.ossec.net/main/license/\n"
 #endif
 
 #ifndef DEFAULTDIR		
-	#define DEFAULTDIR	"/var/ossec"
+	#define DEFAULTDIR	"@OSSEC_DIR@"
 #endif
 
 
