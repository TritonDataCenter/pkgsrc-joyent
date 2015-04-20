$NetBSD$

Add NetBSD support.
--- src/mongo/platform/random.cpp.orig	2015-04-08 20:28:08.000000000 +0000
+++ src/mongo/platform/random.cpp
@@ -117,7 +117,7 @@ namespace mongo {
         return new WinSecureRandom();
     }
 
-#elif defined(__linux__) || defined(__sunos__) || defined(__APPLE__) || defined(__freebsd__)
+#elif defined(__linux__) || defined(__sunos__) || defined(__APPLE__) || defined(__freebsd__) || defined(__netbsd__)
 
     class InputStreamSecureRandom : public SecureRandom {
     public:
