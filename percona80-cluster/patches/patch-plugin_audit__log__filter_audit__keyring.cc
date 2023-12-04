$NetBSD$

Use standard mktime().

--- plugin/audit_log_filter/audit_keyring.cc.orig	2023-12-04 12:04:37.045290921 +0000
+++ plugin/audit_log_filter/audit_keyring.cc
@@ -126,7 +126,7 @@ bool get_keyring_options_key_list_sorted
         std::istringstream ss(pieces_match[1].str());
         ss >> std::get_time(&tm, kOptionsKeyTimestampFormat.c_str());
         tm.tm_isdst = -1;
-        const auto timestamp = timelocal(&tm);
+        const auto timestamp = mktime(&tm);
         ulonglong data_age_days = (time_now - timestamp) / (60 * 60 * 24);
         auto seq_num = std::stoull(pieces_match[2].str());
 
