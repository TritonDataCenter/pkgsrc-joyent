$NetBSD: patch-pdns_htimer.cc,v 1.1 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- pdns/htimer.cc.orig	2013-12-17 17:42:51.000000000 +0000
+++ pdns/htimer.cc
@@ -128,7 +128,7 @@ int main()
     HTimerSentinel hts=htloop.getSentinel();
     for(int i=0; i < 1000; ++i)
     {
-      shared_ptr<char> p(shared_ptr<char>(new char));
+      boost::shared_ptr<char> p(boost::shared_ptr<char>(new char));
     }
   }
 
