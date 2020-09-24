$NetBSD$

Shell portability.

--- make/autoconf/basic_tools.m4.orig	2020-05-13 14:18:16.000000000 +0000
+++ make/autoconf/basic_tools.m4
@@ -316,7 +316,7 @@ AC_DEFUN([BASIC_CHECK_GREP],
   NEEDLE_SPACES='ccc bbb aaa'
   NEEDLE_LIST=${NEEDLE_SPACES// /$'\n'}
   RESULT="$($GREP -Fvx "$STACK_LIST" <<< "$NEEDLE_LIST")"
-  if test "x$RESULT" == "x"; then
+  if test "x$RESULT" = "x"; then
     AC_MSG_RESULT([yes])
   else
     if test "x$OPENJDK_TARGET_OS" = "xaix"; then
