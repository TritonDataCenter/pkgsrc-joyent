$NetBSD$

--- hotspot/make/solaris/makefiles/sparcWorks.make.orig	2012-05-22 07:58:08.759360802 +0000
+++ hotspot/make/solaris/makefiles/sparcWorks.make
@@ -128,7 +128,7 @@ endif
 
 # ARCHFLAGS for the current build arch
 ARCHFLAG    = $(ARCHFLAG/$(BUILDARCH))
-AS_ARCHFLAG = $(ARCHFLAG_OLD/$(BUILDARCH))
+AS_ARCHFLAG = $(ARCHFLAG_NEW/$(BUILDARCH))
 
 # Optional sub-directory in /usr/lib where BUILDARCH libraries are kept.
 ISA_DIR=$(ISA_DIR/$(BUILDARCH))
@@ -212,7 +212,7 @@ endif # 32bit x86
 
 ifeq ("${Platform_arch_model}", "x86_64")
 
-ASFLAGS += $(AS_ARCHFLAG)
+#ASFLAGS += $(AS_ARCHFLAG)
 CFLAGS  += $(ARCHFLAG/amd64)
 # this one seemed useless
 LFLAGS_VM  += $(ARCHFLAG/amd64)
