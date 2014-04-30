$NetBSD: patch-pdns_dynloader.cc,v 1.1 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- pdns/dynloader.cc.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/dynloader.cc
@@ -99,9 +99,9 @@ int main(int argc, char **argv)
 
   try {
     string command=commands[0];
-    shared_ptr<DynMessenger> D;
+    boost::shared_ptr<DynMessenger> D;
     if(::arg()["remote-address"].empty())
-      D=shared_ptr<DynMessenger>(new DynMessenger(localdir,socketname));
+      D=boost::shared_ptr<DynMessenger>(new DynMessenger(localdir,socketname));
     else {
       uint16_t port;
       try {
@@ -112,7 +112,7 @@ int main(int argc, char **argv)
         exit(99);
       }
       
-      D=shared_ptr<DynMessenger>(new DynMessenger(ComboAddress(::arg()["remote-address"], port), ::arg()["secret"]));
+      D=boost::shared_ptr<DynMessenger>(new DynMessenger(ComboAddress(::arg()["remote-address"], port), ::arg()["secret"]));
     }
 
     string message;
