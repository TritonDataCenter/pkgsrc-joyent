$NetBSD$

Ensure bash scripts are called with bash.

--- mk/install.mk.orig	2016-03-03 01:03:46.000000000 +0000
+++ mk/install.mk
@@ -9,7 +9,7 @@
 # except according to those terms.
 
 RUN_INSTALLER = cd tmp/empty_dir && \
-	sh ../../tmp/dist/$(1)/install.sh \
+	bash ../../tmp/dist/$(1)/install.sh \
 		--prefix="$(DESTDIR)$(CFG_PREFIX)" \
 		--libdir="$(DESTDIR)$(CFG_LIBDIR)" \
 		--mandir="$(DESTDIR)$(CFG_MANDIR)"
