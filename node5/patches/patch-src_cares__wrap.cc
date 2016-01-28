$NetBSD: patch-src_cares__wrap.cc,v 1.1 2015/04/30 15:04:56 ryoon Exp $

NetBSD has no AI_V4MAPPED.

--- src/cares_wrap.cc.orig	2016-01-21 01:08:23.000000000 +0000
+++ src/cares_wrap.cc
@@ -1296,8 +1296,10 @@ static void Initialize(Local<Object> tar
               Integer::New(env->isolate(), AF_UNSPEC));
   target->Set(FIXED_ONE_BYTE_STRING(env->isolate(), "AI_ADDRCONFIG"),
               Integer::New(env->isolate(), AI_ADDRCONFIG));
+#if defined(AI_V4MAPPED)
   target->Set(FIXED_ONE_BYTE_STRING(env->isolate(), "AI_V4MAPPED"),
               Integer::New(env->isolate(), AI_V4MAPPED));
+#endif
 
   Local<FunctionTemplate> aiw =
       FunctionTemplate::New(env->isolate(), NewGetAddrInfoReqWrap);
