$NetBSD$

Fix build on SunOS.

--- src/hotspot/share/utilities/hashtable.cpp.orig	2019-01-08 12:44:55.000000000 +0000
+++ src/hotspot/share/utilities/hashtable.cpp
@@ -450,7 +450,7 @@ template class Hashtable<Klass*, mtClass
 template class Hashtable<InstanceKlass*, mtClass>;
 template class Hashtable<oop, mtClass>;
 template class Hashtable<Symbol*, mtModule>;
-#if defined(SOLARIS) || defined(CHECK_UNHANDLED_OOPS)
+#if defined(CHECK_UNHANDLED_OOPS)
 template class Hashtable<oop, mtSymbol>;
 template class RehashableHashtable<oop, mtSymbol>;
 #endif // SOLARIS || CHECK_UNHANDLED_OOPS
