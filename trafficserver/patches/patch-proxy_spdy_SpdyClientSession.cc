$NetBSD$

Remove ambiguity.

--- proxy/spdy/SpdyClientSession.cc.orig	2015-06-30 04:11:56.000000000 +0000
+++ proxy/spdy/SpdyClientSession.cc
@@ -124,8 +124,8 @@ SpdyClientSession::clear()
   // SpdyRequest depends on SpdyClientSession,
   // we should delete it firstly to avoid race.
   //
-  map<int, SpdyRequest *>::iterator iter = req_map.begin();
-  map<int, SpdyRequest *>::iterator endIter = req_map.end();
+  std::map<int, SpdyRequest *>::iterator iter = req_map.begin();
+  std::map<int, SpdyRequest *>::iterator endIter = req_map.end();
   for (; iter != endIter; ++iter) {
     SpdyRequest *req = iter->second;
     if (req) {
