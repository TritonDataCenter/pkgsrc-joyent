$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/command/JunctionCmp.cpp.orig	2013-08-28 22:35:19.000000000 +0000
+++ cgatools/command/JunctionCmp.cpp
@@ -41,7 +41,7 @@ namespace cgatools { namespace command {
             if (config_.calcFileStat_)
                 for (size_t i=0; i<junctFiles_.size();++i) {
                     util::OutputStream statStr(config_.outPrefix_+"stat-"+
-                        boost::filesystem::path(config_.junctionFiles_[i]).leaf());
+                        boost::filesystem::path(config_.junctionFiles_[i]).filename().string());
                     statStr <<"Statistics for " << config_.junctionFiles_[i] << ":" 
                         << std::endl 
                         << std::endl;
@@ -60,13 +60,13 @@ namespace cgatools { namespace command {
             // print compatible junctions
             for (size_t i=0; i<cmp.getCompatible().size(); ++i)
                 cmp.printList(config_.outPrefix_+"compatible_"
-                    +boost::filesystem::path(config_.junctionFiles_[i]).leaf(),
+                    +boost::filesystem::path(config_.junctionFiles_[i]).filename().string(),
                 cmp.getCompatible()[i], junctFiles_[i].metadata_, junctFiles_[i].annotationHeaders_);
 
             // print incompatible junctions
             for (size_t i=0; i<cmp.getIncompatible().size(); ++i)
                 cmp.printList(config_.outPrefix_+"incompatible_"
-                    +boost::filesystem::path(config_.junctionFiles_[i]).leaf(),
+                    +boost::filesystem::path(config_.junctionFiles_[i]).filename().string(),
                 cmp.getIncompatible()[i], junctFiles_[i].metadata_, junctFiles_[i].annotationHeaders_);
 
         }
