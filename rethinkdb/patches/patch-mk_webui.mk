$NetBSD$

cp -P without -R is invalid on SunOS.

--- mk/webui.mk.orig	2015-05-29 12:39:37.000000000 +0000
+++ mk/webui.mk
@@ -115,6 +115,6 @@ $(WEB_ASSETS_BUILD_DIR)/images: | $(WEB_
 
 $(WEB_ASSETS_BUILD_DIR)/favicon.ico: $(FAVICON) | $(WEB_ASSETS_BUILD_DIR)/.
 	$P CP $(FAVICON) $(WEB_ASSETS_BUILD_DIR)
-	cp -P $(FAVICON) $(WEB_ASSETS_BUILD_DIR)
+	cp -p $(FAVICON) $(WEB_ASSETS_BUILD_DIR)
 
 endif # USE_PRECOMPILED_WEB_ASSETS = 1
