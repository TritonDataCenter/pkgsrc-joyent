$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/command/Evidence2Sam.cpp.orig	2013-08-28 22:35:19.000000000 +0000
+++ cgatools/command/Evidence2Sam.cpp
@@ -522,7 +522,7 @@ namespace cgatools { namespace command {
             if (evidenceFileHeader.hasKey("ASSEMBLY_ID")) {
                 assemblyId_ = evidenceFileHeader.get("ASSEMBLY_ID");
             } else {
-                std::string fname = boost::filesystem::path(config_.evidenceDnbsFileName_).leaf();
+                std::string fname = boost::filesystem::path(config_.evidenceDnbsFileName_).filename().string();
                 std::string fprefix = "evidenceDnbs-"+chrName+"-";
                 size_t pos=fname.find(fprefix);
                 if (pos==std::string::npos)
