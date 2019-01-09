$NetBSD$

Remove annoying warning.

--- common/autoconf/basics.m4.orig	2018-10-05 22:05:45.000000000 +0000
+++ common/autoconf/basics.m4
@@ -455,7 +455,7 @@ AC_DEFUN([BASIC_SETUP_TOOL],
       # If it failed, the variable was not from the command line. Ignore it,
       # but warn the user (except for BASH, which is always set by the calling BASH).
       if test "x$1" != xBASH; then
-        AC_MSG_WARN([Ignoring value of $1 from the environment. Use command line variables instead.])
+        :
       fi
       # Try to locate tool using the code snippet
       $2
