$NetBSD$

Add missing include.

--- components/keyrings/common/data/data.h.orig	2023-08-15 13:12:00.000000000 +0000
+++ components/keyrings/common/data/data.h
@@ -23,6 +23,7 @@
 #ifndef DATA_INCLUDED
 #define DATA_INCLUDED
 
+#include <cstdint>
 #include <functional>
 #include <string>
 #include "pfs_string.h"
