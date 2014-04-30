$NetBSD$

Resolve boost symbol ambiguity.
--- pdns/packethandler.cc.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/packethandler.cc
@@ -842,7 +842,7 @@ DNSPacket *PacketHandler::question(DNSPa
 void PacketHandler::synthesiseRRSIGs(DNSPacket* p, DNSPacket* r)
 {
   DLOG(L<<"Need to synthesise the RRSIGs if someone asked for them explicitly"<<endl);
-  typedef map<uint16_t, vector<shared_ptr<DNSRecordContent> > > records_t;
+  typedef map<uint16_t, vector<boost::shared_ptr<DNSRecordContent> > > records_t;
   typedef map<uint16_t, uint32_t> ttls_t;
   records_t records;
   ttls_t ttls;
@@ -889,7 +889,7 @@ void PacketHandler::synthesiseRRSIGs(DNS
     }
     if(rr.content.empty())  // empty contents confuse the MOADNS setup
       rr.content=".";
-    shared_ptr<DNSRecordContent> drc(DNSRecordContent::mastermake(rr.qtype.getCode(), 1, rr.content)); 
+    boost::shared_ptr<DNSRecordContent> drc(DNSRecordContent::mastermake(rr.qtype.getCode(), 1, rr.content)); 
     
     records[rr.qtype.getCode()].push_back(drc);
     ttls[rr.qtype.getCode()]=rr.ttl;
@@ -908,7 +908,7 @@ void PacketHandler::synthesiseRRSIGs(DNS
     DNSSECKeeper::keyset_t keyset = d_dk.getKeys(p->qdomain);
     BOOST_FOREACH(DNSSECKeeper::keyset_t::value_type value, keyset) {
 
-      records[QType::DNSKEY].push_back(shared_ptr<DNSRecordContent>(DNSRecordContent::mastermake(QType::DNSKEY, 1, value.first.getDNSKEY().getZoneRepresentation())));
+      records[QType::DNSKEY].push_back(boost::shared_ptr<DNSRecordContent>(DNSRecordContent::mastermake(QType::DNSKEY, 1, value.first.getDNSKEY().getZoneRepresentation())));
       ttls[QType::DNSKEY]=sd.default_ttl;
       nrc.d_set.insert(QType::DNSKEY);
     }
@@ -933,7 +933,7 @@ void PacketHandler::synthesiseRRSIGs(DNS
     if(pdns_iequals(p->qdomain, sd.qname)) {
       ns3pr.d_flags = 0; // the NSEC3PARAM 'flag' is defined to always be zero in RFC5155.
 
-      records[QType::NSEC3PARAM].push_back(shared_ptr<DNSRecordContent>(DNSRecordContent::mastermake(QType::NSEC3PARAM, 1, ns3pr.getZoneRepresentation())));
+      records[QType::NSEC3PARAM].push_back(boost::shared_ptr<DNSRecordContent>(DNSRecordContent::mastermake(QType::NSEC3PARAM, 1, ns3pr.getZoneRepresentation())));
       ttls[QType::NSEC3PARAM]=sd.default_ttl;
       n3rc.d_set.insert(QType::NSEC3PARAM);
     }
@@ -947,7 +947,7 @@ void PacketHandler::synthesiseRRSIGs(DNS
     nrc.d_set.insert(QType::NSEC);
     nrc.d_next=after;
 
-    records[QType::NSEC].push_back(shared_ptr<DNSRecordContent>(DNSRecordContent::mastermake(QType::NSEC, 1, nrc.getZoneRepresentation())));
+    records[QType::NSEC].push_back(boost::shared_ptr<DNSRecordContent>(DNSRecordContent::mastermake(QType::NSEC, 1, nrc.getZoneRepresentation())));
     ttls[QType::NSEC]=sd.default_ttl;
 
     // ok, the NSEC is in..
