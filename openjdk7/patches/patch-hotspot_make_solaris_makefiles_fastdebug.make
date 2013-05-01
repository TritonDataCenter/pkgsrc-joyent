$NetBSD$

--- hotspot/make/solaris/makefiles/fastdebug.make.orig	2013-02-19 23:21:59.000000000 +0000
+++ hotspot/make/solaris/makefiles/fastdebug.make
@@ -116,7 +116,11 @@ MAPFILE = $(GAMMADIR)/make/solaris/makef
 
 # This mapfile is only needed when compiling with dtrace support, 
 # and mustn't be otherwise.
-MAPFILE_DTRACE = $(GAMMADIR)/make/solaris/makefiles/mapfile-vers-$(TYPE)
+ifdef USE_GCC
+  MAPFILE_DTRACE = $(GAMMADIR)/make/solaris/makefiles/mapfile-vers-$(TYPE).gcc
+else
+  MAPFILE_DTRACE = $(GAMMADIR)/make/solaris/makefiles/mapfile-vers-$(TYPE)
+endif # USE_GCC
 
 G_SUFFIX = _g
 VERSION = optimized
