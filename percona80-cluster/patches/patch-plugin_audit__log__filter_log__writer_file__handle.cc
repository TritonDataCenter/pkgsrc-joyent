$NetBSD$

Use standard mktime().

--- plugin/audit_log_filter/log_writer/file_handle.cc.orig	2023-12-04 12:04:47.319047298 +0000
+++ plugin/audit_log_filter/log_writer/file_handle.cc
@@ -263,7 +263,7 @@ PruneFilesList FileHandle::get_prune_fil
         std::istringstream ss(parsed_file_name.get_rotation_time());
         ss >> std::get_time(&tm, kRotationTimeFormat.c_str());
         tm.tm_isdst = -1;
-        auto time_rotated = timelocal(&tm);
+        auto time_rotated = mktime(&tm);
 
         prune_files.push_back(
             {entry.path(), entry.file_size(),
