$NetBSD$

Need utility.h for std::pair

--- cgatools/variants/AlleleDiffSegment.hpp.orig	2013-08-28 22:35:19.000000000 +0000
+++ cgatools/variants/AlleleDiffSegment.hpp
@@ -18,6 +18,7 @@
 //! @file AlleleDiffSegment.hpp
 
 #include "cgatools/core.hpp"
+#include <utility>
 
 namespace cgatools { namespace variants {
 
