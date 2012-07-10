$NetBSD$

--- hotspot/make/solaris/makefiles/saproc.make.orig	2011-06-27 16:10:23.000000000 +0000
+++ hotspot/make/solaris/makefiles/saproc.make
@@ -99,7 +99,7 @@ $(LIBSAPROC): $(SASRCFILES) $(SAMAPFILE)
 	           $(SASRCFILES)                                        \
 	           $(SA_LFLAGS)                                         \
 	           -o $@                                                \
-	           -ldl -ldemangle -lthread -lc
+	           -ldl -L$(PREFIX)/lib -ldemangle -lthread -lc
 	[ -f $(LIBSAPROC_G) ] || { ln -s $@ $(LIBSAPROC_G); }
 
 install_saproc: $(BULDLIBSAPROC)
