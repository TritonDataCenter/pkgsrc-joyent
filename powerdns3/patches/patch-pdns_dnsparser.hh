$NetBSD: patch-pdns_dnsparser.hh,v 1.1 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- pdns/dnsparser.hh.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/dnsparser.hh
@@ -176,7 +176,7 @@ public:
     return record;
   }
 
-  static shared_ptr<DNSRecordContent> unserialize(const string& qname, uint16_t qtype, const string& serialized);
+  static boost::shared_ptr<DNSRecordContent> unserialize(const string& qname, uint16_t qtype, const string& serialized);
 
   void doRecordCheck(const struct DNSRecord&){}
 
@@ -320,9 +320,9 @@ public:
   //! All answers contained in this packet
   answers_t d_answers;
 
-  shared_ptr<PacketReader> getPacketReader(uint16_t offset)
+  boost::shared_ptr<PacketReader> getPacketReader(uint16_t offset)
   {
-    shared_ptr<PacketReader> pr(new PacketReader(d_content));
+    boost::shared_ptr<PacketReader> pr(new PacketReader(d_content));
     pr->d_pos=offset;
     return pr;
   }
