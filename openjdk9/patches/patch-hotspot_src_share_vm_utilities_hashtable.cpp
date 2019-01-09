$NetBSD$

Fix build on SunOS.

--- hotspot/src/share/vm/utilities/hashtable.cpp.orig	2017-08-01 09:03:05.000000000 +0000
+++ hotspot/src/share/vm/utilities/hashtable.cpp
@@ -401,7 +401,7 @@ template class Hashtable<Symbol*, mtSymb
 template class Hashtable<Klass*, mtClass>;
 template class Hashtable<InstanceKlass*, mtClass>;
 template class Hashtable<oop, mtClass>;
-#if defined(SOLARIS) || defined(CHECK_UNHANDLED_OOPS)
+#if defined(CHECK_UNHANDLED_OOPS)
 template class Hashtable<oop, mtSymbol>;
 template class RehashableHashtable<oop, mtSymbol>;
 #endif // SOLARIS || CHECK_UNHANDLED_OOPS
