$NetBSD$

--- make/autoconf/util.m4.orig	2020-05-13 14:18:16.000000000 +0000
+++ make/autoconf/util.m4
@@ -495,7 +495,7 @@ AC_DEFUN([UTIL_SETUP_TOOL],
       # If it failed, the variable was not from the command line. Ignore it,
       # but warn the user (except for BASH, which is always set by the calling BASH).
       if test "x$1" != xBASH; then
-        AC_MSG_WARN([Ignoring value of $1 from the environment. Use command line variables instead.])
+        :
       fi
       # Try to locate tool using the code snippet
       $2
