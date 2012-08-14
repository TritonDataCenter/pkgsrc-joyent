$NetBSD: patch-contrib_dblink_dblink.c,v 1.1.1.1 2011/09/15 08:27:39 adam Exp $

--- contrib/dblink/dblink.c.orig	Thu Aug  2 22:23:20 2012
+++ contrib/dblink/dblink.c	Mon Aug 13 21:15:39 2012
@@ -46,7 +46,7 @@
 #include "parser/scansup.h"
 #include "utils/acl.h"
 #include "utils/builtins.h"
-#include "utils/fmgroids.h"
+#include "postgresql/server/utils/fmgroids.h"
 #include "utils/lsyscache.h"
 #include "utils/memutils.h"
 #include "utils/rel.h"
