$NetBSD$

Add support for NetBSD.

--- src/cares_wrap.cc.orig	2015-02-06 20:04:23.000000000 +0000
+++ src/cares_wrap.cc
@@ -1301,8 +1301,10 @@ static void Initialize(Handle<Object> ta
               Integer::New(env->isolate(), AF_UNSPEC));
   target->Set(FIXED_ONE_BYTE_STRING(env->isolate(), "AI_ADDRCONFIG"),
               Integer::New(env->isolate(), AI_ADDRCONFIG));
+#if defined(AI_V4MAPPED)
   target->Set(FIXED_ONE_BYTE_STRING(env->isolate(), "AI_V4MAPPED"),
               Integer::New(env->isolate(), AI_V4MAPPED));
+#endif
 
   Local<FunctionTemplate> aiw =
       FunctionTemplate::New(env->isolate(), NewGetAddrInfoReqWrap);
