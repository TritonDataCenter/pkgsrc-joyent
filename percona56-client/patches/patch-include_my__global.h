$NetBSD: patch-include_my__global.h,v 1.2 2013/12/03 20:02:42 adam Exp $

--- include/my_global.h.orig	2014-11-21 10:02:01.000000000 +0000
+++ include/my_global.h
@@ -1122,7 +1122,8 @@ typedef char		my_bool; /* Small bool */
 
 /* Provide __func__ macro definition for platforms that miss it. */
 #if __STDC_VERSION__ < 199901L
-#  if __GNUC__ >= 2
+#  if __GNUC__ >= 4
+#  elif __GNUC__ >= 2
 #    define __func__ __FUNCTION__
 #  else
 #    define __func__ "<unknown>"
