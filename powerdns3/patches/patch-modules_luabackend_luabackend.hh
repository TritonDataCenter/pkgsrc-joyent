$NetBSD$

u_int32_t not defined on SunOS.
--- modules/luabackend/luabackend.hh.orig	2014-02-04 11:33:04.000000000 +0000
+++ modules/luabackend/luabackend.hh
@@ -17,6 +17,9 @@ using std::string;
 
 //#undef L
 
+#ifdef __sun
+typedef uint32_t u_int32_t;
+#endif
 
 
 class LUAException {
