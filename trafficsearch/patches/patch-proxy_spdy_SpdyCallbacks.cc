$NetBSD$

Remove ambiguity.

--- proxy/spdy/SpdyCallbacks.cc.orig	2015-06-30 04:11:56.000000000 +0000
+++ proxy/spdy/SpdyCallbacks.cc
@@ -369,8 +369,8 @@ unsigned
 spdy_session_delta_window_size(SpdyClientSession *sm)
 {
   unsigned sess_delta_window_size = 0;
-  map<int, SpdyRequest *>::iterator iter = sm->req_map.begin();
-  map<int, SpdyRequest *>::iterator endIter = sm->req_map.end();
+  std::map<int, SpdyRequest *>::iterator iter = sm->req_map.begin();
+  std::map<int, SpdyRequest *>::iterator endIter = sm->req_map.end();
   for (; iter != endIter; ++iter) {
     SpdyRequest *req = iter->second;
     sess_delta_window_size += req->delta_window_size;
