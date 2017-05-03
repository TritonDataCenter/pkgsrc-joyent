$NetBSD$

* Portability: include <bstring.h> if exists.

--- client/completion_hash.cc.orig	2014-11-21 10:02:01.000000000 +0000
+++ client/completion_hash.cc
@@ -22,6 +22,10 @@
 
 #include <my_global.h>
 #include <m_string.h>
+#ifdef NEEDS_BSTRING_H                         // defines bzero()
+#include <bstring.h>
+#endif
+
 #include <my_sys.h>
 #include "completion_hash.h"
 
