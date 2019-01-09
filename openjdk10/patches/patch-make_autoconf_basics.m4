$NetBSD$

Remove annoying warning.

--- make/autoconf/basics.m4.orig	2019-01-08 13:47:15.651469500 +0000
+++ make/autoconf/basics.m4
@@ -381,7 +381,7 @@ AC_DEFUN([BASIC_SETUP_TOOL],
       # If it failed, the variable was not from the command line. Ignore it,
       # but warn the user (except for BASH, which is always set by the calling BASH).
       if test "x$1" != xBASH; then
-        AC_MSG_WARN([Ignoring value of $1 from the environment. Use command line variables instead.])
+        :
       fi
       # Try to locate tool using the code snippet
       $2
