$NetBSD$

Spell uint32_t correctly.  Note that we explicitly do not just rename it via
CPPFLAGS as there are other parts of the code (libedit etc) that then do not
work correctly.

--- storage/innobase/xtrabackup/src/xbcloud/xbcloud.cc.orig	2023-07-13 07:32:22.000000000 +0000
+++ storage/innobase/xtrabackup/src/xbcloud/xbcloud.cc
@@ -129,7 +129,7 @@ static ulong opt_threads = 1;
 static char *opt_fifo_dir = nullptr;
 static ulong opt_fifo_timeout = 60;
 static ulong opt_max_retries = 10;
-static u_int32_t opt_max_backoff = 300000;
+static uint32_t opt_max_backoff = 300000;
 
 static bool opt_insecure = false;
 static bool opt_md5 = false;
