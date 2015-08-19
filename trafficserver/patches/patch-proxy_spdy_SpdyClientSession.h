$NetBSD$

Remove ambiguity.

--- proxy/spdy/SpdyClientSession.h.orig	2015-06-30 04:11:56.000000000 +0000
+++ proxy/spdy/SpdyClientSession.h
@@ -116,7 +116,7 @@ public:
   int event;
   spdylay_session *session;
 
-  map<int32_t, SpdyRequest *> req_map;
+  std::map<int32_t, SpdyRequest *> req_map;
 
   virtual char const *getPluginTag() const;
   virtual int64_t getPluginId() const;
@@ -124,7 +124,7 @@ public:
   SpdyRequest *
   find_request(int streamId)
   {
-    map<int32_t, SpdyRequest *>::iterator iter = this->req_map.find(streamId);
+    std::map<int32_t, SpdyRequest *>::iterator iter = this->req_map.find(streamId);
     return ((iter == this->req_map.end()) ? NULL : iter->second);
   }
 
