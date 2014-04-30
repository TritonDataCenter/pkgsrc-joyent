$NetBSD: patch-pdns_dynmessenger.cc,v 1.1 2011/11/23 23:32:17 joerg Exp $

Add stdlib.h header.
--- pdns/dynmessenger.cc.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/dynmessenger.cc
@@ -24,6 +24,7 @@
 #include <iostream>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <stdlib.h>
 
 DynMessenger::DynMessenger(const string &localdir, const string &fname)
 {
