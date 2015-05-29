$NetBSD$

Shell portability.

--- external/v8_3.30.33.16/tools/run-llprof.sh.orig	2015-03-30 21:14:22.000000000 +0000
+++ external/v8_3.30.33.16/tools/run-llprof.sh
@@ -46,7 +46,7 @@ framework, then calls the low level tick
 EOF
 }
 
-if [ $# -eq 0 ] || [ "$1" == "-h" ]  || [ "$1" == "--help" ] ; then
+if [ $# -eq 0 ] || [ "$1" = "-h" ]  || [ "$1" = "--help" ] ; then
   usage
   exit 1
 fi
