$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3
Avoid "SS" define on SunOS.

--- cgatools/variants/calib/CalibratedScorer.cpp.orig	2013-08-28 22:35:19.000000000 +0000
+++ cgatools/variants/calib/CalibratedScorer.cpp
@@ -191,9 +191,9 @@ namespace cgatools { namespace variants
         for(bfs::directory_iterator first(dataPath); first!=last; ++first)
         {
             if (InputStream::isReadable( (first->path() / "metrics.tsv").string() ) &&
-                boost::starts_with(first->path().leaf(), "version"))
+                boost::starts_with(first->path().filename().string(), "version"))
             {
-                int iiVersion = swVersionToInt(first->path().leaf().substr(7));
+                int iiVersion = swVersionToInt(first->path().filename().string().substr(7));
                 if (iiVersion <= swVersion && iiVersion > bestVersion)
                 {
                     bestVersion = iiVersion;
@@ -214,7 +214,7 @@ namespace cgatools { namespace variants
         std::istream& inData,
         const std::string& fnData,
         CoverageBinner& binner,
-        std::vector< std::vector<double> >& SS,
+        std::vector< std::vector<double> >& cgaSS,
         int32_t& minScore)
     {
         DelimitedFile df(inData, fnData);
@@ -227,7 +227,7 @@ namespace cgatools { namespace variants
                 cvgLevels.push_back(boost::lexical_cast<int32_t>(colHeader.substr(3)));
         }
         binner = CoverageBinner(cvgLevels);
-        SS.resize(binner_.getBinCount());
+        cgaSS.resize(binner_.getBinCount());
 
         int32_t score = 0;
         vector<double> oneScoreData(binner_.getBinCount(), 0.0);
@@ -251,7 +251,7 @@ namespace cgatools { namespace variants
             prevScore = score;
 
             for(size_t ii=0; ii<binner_.getBinCount(); ii++)
-                SS[ii].push_back(oneScoreData[ii]);
+                cgaSS[ii].push_back(oneScoreData[ii]);
         }
     }
 
