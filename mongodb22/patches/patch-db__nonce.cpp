$NetBSD$

Add support for NetBSD.
--- src/mongo/db/nonce.cpp.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/db/nonce.cpp
@@ -38,7 +38,7 @@ namespace mongo {
         if( _initialized ) return;
         _initialized = true;
 
-#if defined(__linux__) || defined(__sunos__) || defined(__APPLE__)
+#if defined(__linux__) || defined(__sunos__) || defined(__APPLE__) || defined(__netbsd__)
         _devrandom = new ifstream("/dev/urandom", ios::binary|ios::in);
         if ( !_devrandom->is_open() )
             massert( 10353 , std::string("can't open dev/urandom: ") + strerror(errno), 0 );
