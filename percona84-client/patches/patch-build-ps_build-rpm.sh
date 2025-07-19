$NetBSD$

Shell portability fix.

--- build-ps/build-rpm.sh.orig	2019-05-03 11:55:18.000000000 +0000
+++ build-ps/build-rpm.sh
@@ -85,7 +85,7 @@ else
 fi
 
 # If we're in 32 bits, ensure that we're compiling for i686.
-if test "x$TARGET" == "x"
+if test "x$TARGET" = "x"
 then
     if test "x$(uname -m)" != "xx86_64"
     then
