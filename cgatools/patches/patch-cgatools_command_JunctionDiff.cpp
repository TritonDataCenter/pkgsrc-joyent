$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/command/JunctionDiff.cpp.orig	2013-08-28 22:35:19.000000000 +0000
+++ cgatools/command/JunctionDiff.cpp
@@ -58,7 +58,7 @@ namespace cgatools { namespace command {
                 if (config_.calcFileStat_)
                     for (size_t i=0; i<junctFiles_.size();++i) {
                         util::OutputStream statStr(config_.outPrefix_+"stat-"+
-                            boost::filesystem::path(config_.junctionFiles_[i]).leaf());
+                            boost::filesystem::path(config_.junctionFiles_[i]).filename().string());
                         statStr <<"Statistics for " << config_.junctionFiles_[i] << ":" 
                             << std::endl 
                             << std::endl;
@@ -90,7 +90,7 @@ namespace cgatools { namespace command {
 
             // print incompatible junctions
             cmp.printList(config_.outPrefix_+"diff-"+
-                boost::filesystem::path(config_.junctionFiles_[0]).leaf(), 
+                boost::filesystem::path(config_.junctionFiles_[0]).filename().string(),
                 incompatible, (*junctFiles_)[0].metadata_, (*junctFiles_)[0].annotationHeaders_);
 
             if (config_.outputVcf_)
