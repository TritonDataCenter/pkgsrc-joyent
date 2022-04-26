$NetBSD$

Use standard types.

--- storage/innobase/xtrabackup/src/xbcloud/xbcloud.cc.orig	2022-04-19 08:05:43.000000000 +0000
+++ storage/innobase/xtrabackup/src/xbcloud/xbcloud.cc
@@ -117,7 +117,7 @@ static std::string backup_name;
 static char *opt_cacert = nullptr;
 static ulong opt_parallel = 1;
 static ulong opt_max_retries = 10;
-static u_int32_t opt_max_backoff = 300000;
+static uint32_t opt_max_backoff = 300000;
 
 static bool opt_insecure = false;
 static bool opt_md5 = false;
