$NetBSD: patch-modules_pipebackend_pipebackend.hh,v 1.1 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- modules/pipebackend/pipebackend.hh.orig	2014-06-03 07:42:02.000000000 +0000
+++ modules/pipebackend/pipebackend.hh
@@ -44,7 +44,7 @@ public:
   static DNSBackend *maker();
   
 private:
-  shared_ptr<CoWrapper> d_coproc;
+  boost::shared_ptr<CoWrapper> d_coproc;
   string d_qname;
   QType d_qtype;
   Regex* d_regex;
