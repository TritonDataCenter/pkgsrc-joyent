$NetBSD$

Patch conflicting types on SunOS.
--- machine/m_sunos5.c.orig	2013-06-11 03:03:04.000000000 +0000
+++ machine/m_sunos5.c
@@ -1152,8 +1152,7 @@ get_process_info(
 				 struct system_info * si,
 				 struct process_select * sel,
 				 int compare_index,
-				 char *conninfo,
-				 int mode)
+				 char *conninfo)
 {
 	register int i;
 	register int total_procs;
