$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/mapping/LaneBatchCache.cpp.orig	2013-08-28 22:35:17.000000000 +0000
+++ cgatools/mapping/LaneBatchCache.cpp
@@ -83,7 +83,7 @@ void InLaneBatchStreams::collectFiles()
     BOOST_FOREACH(const boost::filesystem::path& fname,filesFound)
     {
         boost::smatch what;
-        std::string leaf = fname.leaf();
+        std::string leaf = fname.filename().string();
 
         if (!boost::regex_match(leaf, what, re)) 
             continue;
