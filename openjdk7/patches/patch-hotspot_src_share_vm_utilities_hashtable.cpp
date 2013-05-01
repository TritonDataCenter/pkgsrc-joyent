$NetBSD$

--- hotspot/src/share/vm/utilities/hashtable.cpp.orig	2013-02-19 23:21:59.000000000 +0000
+++ hotspot/src/share/vm/utilities/hashtable.cpp
@@ -319,7 +319,9 @@ template class Hashtable<Symbol*, mtSymb
 template class Hashtable<klassOop, mtClass>;
 template class Hashtable<oop, mtClass>;
 #ifdef SOLARIS
+#ifdef SPARC_WORKS
 template class Hashtable<oop, mtSymbol>;
+#endif // SPARC_WORKS
 #endif
 template class Hashtable<oopDesc*, mtSymbol>;
 template class Hashtable<Symbol*, mtClass>;
