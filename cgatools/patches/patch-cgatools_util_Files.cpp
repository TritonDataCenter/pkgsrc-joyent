$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/util/Files.cpp.orig	2013-08-28 22:35:16.000000000 +0000
+++ cgatools/util/Files.cpp
@@ -47,7 +47,7 @@ namespace cgatools { namespace util { na
             for ( boost::filesystem::directory_iterator itr( directory ); itr != end_itr; ++itr )
             {
                 if (!is_directory(itr->status())) {
-                    if (boost::regex_search(itr->path().leaf().c_str(), re))
+                    if (boost::regex_search(itr->path().filename().c_str(), re))
                     {
                         if (completePaths) {
                             filesFound.push_back(boost::filesystem::system_complete(itr->path()));
@@ -59,7 +59,7 @@ namespace cgatools { namespace util { na
                 }
                 else {
                     if (includeDir) {
-                        if (boost::regex_search(itr->path().leaf().c_str(), re)) {
+                        if (boost::regex_search(itr->path().filename().c_str(), re)) {
                             if (completePaths) {
                                 filesFound.push_back(boost::filesystem::system_complete(itr->path()));
                             }
@@ -95,7 +95,7 @@ namespace cgatools { namespace util { na
         for (boost::filesystem::directory_iterator it(dir), itEnd; it != itEnd; ++it)
         {
             boost::smatch what;
-            std::string fname(it->leaf());
+            std::string fname(it->path().filename().string());
             if (boost::regex_match(fname, re)) {
                 result.push_back(fname);
                 if (--maxFiles==0)
@@ -122,10 +122,10 @@ namespace cgatools { namespace util { na
         for (size_t ii = 0; ii < extCount; ++ii)
         {
             boost::filesystem::path p = dir / (baseName + exts[ii]);
-            if (InputStream::isReadable(p.external_file_string()))
-                return p.external_file_string();
+            if (InputStream::isReadable(p.native()))
+                return p.native();
         }
-        return (dir / baseName).external_file_string();
+        return (dir / baseName).native();
     }
 
     std::string findDataFileRegex(const boost::filesystem::path& dir, const std::string& baseName)
@@ -138,9 +138,9 @@ namespace cgatools { namespace util { na
             vector<string> fns = listDir(dir, baseName+exts[ii], 2);
             if (fns.size() > 1)
                 throw Exception("multiple files matching regex "+baseName+exts[ii]+
-                                " in directory "+dir.external_file_string());
+                                " in directory "+dir.native());
             if (1 == fns.size())
-                return (dir / fns[0]).external_file_string();
+                return (dir / fns[0]).native();
         }
         return "";
     }
@@ -161,7 +161,7 @@ namespace cgatools { namespace util { na
         if (exnOnFail)
         {
             string nameList = boost::join(possibleBaseNames, " or ");
-            throw Exception("failed to find "+nameList+" in "+dir.external_file_string());
+            throw Exception("failed to find "+nameList+" in "+dir.native());
         }
         return "";
     }
