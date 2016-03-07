$NetBSD$

Ensure bash scripts are called with bash.

--- mk/dist.mk.orig	2016-03-03 01:03:46.000000000 +0000
+++ mk/dist.mk
@@ -308,8 +308,8 @@ distcheck-tar-bins: dist-tar-bins
 	$(Q)mkdir -p tmp/distcheck
 	$(Q)cd tmp/distcheck && tar -xzf ../../dist/$(PKG_NAME)-$(CFG_BUILD).tar.gz
 	$(Q)mkdir -p tmp/distcheck/tarbininstall
-	$(Q)sh tmp/distcheck/$(PKG_NAME)-$(CFG_BUILD)/install.sh --prefix=tmp/distcheck/tarbininstall
-	$(Q)sh tmp/distcheck/$(PKG_NAME)-$(CFG_BUILD)/install.sh --prefix=tmp/distcheck/tarbininstall --uninstall
+	$(Q)bash tmp/distcheck/$(PKG_NAME)-$(CFG_BUILD)/install.sh --prefix=tmp/distcheck/tarbininstall
+	$(Q)bash tmp/distcheck/$(PKG_NAME)-$(CFG_BUILD)/install.sh --prefix=tmp/distcheck/tarbininstall --uninstall
 	$(Q)rm -Rf tmp/distcheck/$(PKG_NAME)-$(CFG_BUILD)
 	$(Q)rm -Rf tmp/distcheck/tarbininstall
 
