$NetBSD$

Make sure we stay compatible with Boost 1.50.x
--- src/mongo/util/time_support.h.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/util/time_support.h
@@ -86,10 +86,6 @@ namespace mongo {
     struct tm *gmtime(const time_t *timep);
     struct tm *localtime(const time_t *timep);
 
-#if defined(MONGO_BOOST_TIME_UTC_HACK) || (BOOST_VERSION >= 105000)
 #define MONGO_BOOST_TIME_UTC boost::TIME_UTC_
-#else
-#define MONGO_BOOST_TIME_UTC boost::TIME_UTC
-#endif
 
 }  // namespace mongo
