$NetBSD$

Fix __sun definition.

--- src/sarray.c.orig	2012-01-22 18:29:15.000000000 +0000
+++ src/sarray.c
@@ -1846,7 +1846,7 @@ struct dirent  *pdirentry;
         /* It's nice to ignore directories.  For this it is necessary to
          * define _BSD_SOURCE in the CC command, because the DT_DIR
          * flag is non-standard.  */
-#if !defined(__SOLARIS__)
+#if !defined(__sun)
         if (pdirentry->d_type == DT_DIR)
             continue;
 #endif
