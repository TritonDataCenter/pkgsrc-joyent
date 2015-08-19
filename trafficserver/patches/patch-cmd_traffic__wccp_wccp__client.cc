$NetBSD$

Use getopt_long for better portability, same as the rest of the code.

--- cmd/traffic_wccp/wccp_client.cc.orig	2015-06-30 04:11:56.000000000 +0000
+++ cmd/traffic_wccp/wccp_client.cc
@@ -141,7 +141,7 @@ main(int argc, char **argv)
   bool fail = false;
   char const *FAIL_MSG = "";
 
-  while (-1 != (zret = getopt_long_only(argc, argv, "", OPTIONS, &zidx))) {
+  while (-1 != (zret = getopt_long(argc, argv, "", OPTIONS, &zidx))) {
     switch (zret) {
     case OPT_HELP:
       FAIL_MSG = "Usage:";
