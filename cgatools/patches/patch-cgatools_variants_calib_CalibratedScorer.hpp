$NetBSD$

Avoid "SS" define on SunOS.

--- cgatools/variants/calib/CalibratedScorer.hpp.orig	2013-08-28 22:35:19.000000000 +0000
+++ cgatools/variants/calib/CalibratedScorer.hpp
@@ -152,7 +152,7 @@ namespace cgatools { namespace variants
             std::istream& inData,
             const std::string& fnData,
             CoverageBinner& binner,
-            std::vector< std::vector<double> >& SS,
+            std::vector< std::vector<double> >& cgaSS,
             int32_t& minScore);
 
         size_t scoreToOffset(int32_t score) const
