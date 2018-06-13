$NetBSD$

Add missing include.

--- mysys/mf_iocache2.c.orig	2018-05-29 21:11:24.000000000 +0000
+++ mysys/mf_iocache2.c
@@ -24,6 +24,7 @@
 #include <m_string.h>
 #include <stdarg.h>
 #include <m_ctype.h>
+#include "mysql/psi/mysql_file.h"
 
 /*
   Copy contents of an IO_CACHE to a file.
