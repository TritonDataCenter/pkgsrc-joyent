$NetBSD$

Use PKGMANDIR.
Install config to example directory, exclude init script and instances.d.

--- mk/install.mk.orig	2015-03-30 21:14:22.000000000 +0000
+++ mk/install.mk
@@ -37,7 +37,7 @@ etc_dir ?= $(SYSCONFDIR)
 var_dir ?= $(LOCALSTATEDIR)
 bin_dir := $(prefix)/bin
 doc_dir := $(prefix)/share/doc/$(VERSIONED_PACKAGE_NAME)
-man_dir := $(prefix)/share/man
+man_dir := $(prefix)/$(PKGMANDIR)
 man1_dir := $(man_dir)/man1
 share_dir := $(prefix)/share/$(VERSIONED_PACKAGE_NAME)
 scripts_dir := $(share_dir)/scripts
@@ -96,10 +96,8 @@ install-init:
 
 .PHONY: install-config
 install-config:
-	$P INSTALL $(DESTDIR)$(conf_dir)/default.conf.sample
-	umask 022 && install -m755 -d $(DESTDIR)$(conf_dir)
-	umask 022 && install -m755 -d $(DESTDIR)$(conf_instance_dir)
-	install -m644 $(ASSETS_DIR)/config/default.conf.sample $(DESTDIR)$(conf_dir)/default.conf.sample
+	$P INSTALL $(DESTDIR)$(prefix)/share/examples/rethinkdb/default.conf.sample
+	install -m644 $(ASSETS_DIR)/config/default.conf.sample $(DESTDIR)$(prefix)/share/examples/rethinkdb/default.conf.sample
 
 .PHONY: install-data
 install-data:
@@ -113,4 +111,4 @@ install-docs:
 	install -m644 $(ASSETS_DIR)/docs/LICENSE $(DESTDIR)$(doc_dir)/copyright
 
 .PHONY: install
-install: install-binaries install-manpages install-docs install-init install-data install-config
+install: install-binaries install-manpages install-docs install-config
