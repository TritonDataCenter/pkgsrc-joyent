$NetBSD$

Need cassert for assert()

--- percona-xtradb-cluster-galera/galerautils/src/gu_buffer.hpp.orig	2020-12-23 17:43:52.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_buffer.hpp
@@ -13,6 +13,7 @@
 
 #include "gu_shared_ptr.hpp"
 #include <vector>
+#include <cassert>
 
 namespace gu
 {
