$NetBSD: patch-modules_pipebackend_pipebackend.hh,v 1.1 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- modules/pipebackend/pipebackend.hh.orig	2013-04-26 19:54:34.000000000 +0000
+++ modules/pipebackend/pipebackend.hh
@@ -43,7 +43,7 @@ public:
   static DNSBackend *maker();
   
 private:
-  shared_ptr<CoWrapper> d_coproc;
+  boost::shared_ptr<CoWrapper> d_coproc;
   string d_qname;
   QType d_qtype;
   Regex* d_regex;
