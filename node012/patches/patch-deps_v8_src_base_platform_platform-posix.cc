$NetBSD$

Add support for NetBSD.

--- deps/v8/src/base/platform/platform-posix.cc.orig	2015-02-06 20:04:23.000000000 +0000
+++ deps/v8/src/base/platform/platform-posix.cc
@@ -31,6 +31,10 @@
 #include <sys/sysctl.h>  // NOLINT, for sysctl
 #endif
 
+#ifdef __NetBSD__
+#define PTHREAD_STACK_MIN MINSIGSTKSZ
+#endif
+
 #include <arpa/inet.h>
 #include <netdb.h>
 #include <netinet/in.h>
@@ -328,7 +332,7 @@ int OS::GetCurrentThreadId() {
 #elif V8_OS_ANDROID
   return static_cast<int>(gettid());
 #else
-  return static_cast<int>(pthread_self());
+  return static_cast<int>(reinterpret_cast<intptr_t>(pthread_self()));
 #endif
 }
 
@@ -536,7 +540,7 @@ static void SetThreadName(const char* na
   pthread_set_name_np(pthread_self(), name);
 #elif V8_OS_NETBSD
   STATIC_ASSERT(Thread::kMaxThreadNameLength <= PTHREAD_MAX_NAMELEN_NP);
-  pthread_setname_np(pthread_self(), "%s", name);
+  pthread_setname_np(pthread_self(), "%s", (void*)name);
 #elif V8_OS_MACOSX
   // pthread_setname_np is only available in 10.6 or later, so test
   // for it at runtime.
