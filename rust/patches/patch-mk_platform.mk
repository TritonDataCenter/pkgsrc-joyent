$NetBSD$

SunOS ar(1) does not support ranlib mode.

--- mk/platform.mk.orig	2016-03-03 01:03:46.000000000 +0000
+++ mk/platform.mk
@@ -151,7 +151,11 @@ define CC_MACROS
     CFG_CREATE_ARCHIVE_$(1)=$$(AR_$(1)) -OUT:$$(1)
   else
     CFG_CC_OUTPUT_$(1)=-o $$(1)
-    CFG_CREATE_ARCHIVE_$(1)=$$(AR_$(1)) crus $$(1)
+    ifeq (,$(filter $(OSTYPE_$(1)),solaris))
+      CFG_CREATE_ARCHIVE_$(1)=$$(AR_$(1)) cru $$(1)
+    else
+      CFG_CREATE_ARCHIVE_$(1)=$$(AR_$(1)) crus $$(1)
+    endif
   endif
 endef
 
