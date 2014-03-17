$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/cgdata/GenomeMetadata.cpp.orig	2013-08-28 22:35:17.000000000 +0000
+++ cgatools/cgdata/GenomeMetadata.cpp
@@ -215,12 +215,12 @@ namespace cgatools { namespace cgdata {
         for (fs::directory_iterator it(asmDir_); it != itEnd; ++it)
         {
             boost::smatch what;
-            std::string fname(it->leaf());
+            std::string fname(it->path().filename().string());
             if (!boost::regex_match(fname, what, re)) {
                 continue;
             }
             asmIdCache_ = what[1];
-            varFiles.push_back(it->path().external_file_string());
+            varFiles.push_back(it->path().native());
             asmIds.push_back(asmIdCache_);
         }
         if (asmIdCache_.empty())
