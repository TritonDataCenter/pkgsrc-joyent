$NetBSD$

Override AddCXXStdlibLibArgs().

--- lib/Driver/ToolChains/Solaris.h.orig	2018-01-04 07:43:41.000000000 +0000
+++ lib/Driver/ToolChains/Solaris.h
@@ -60,6 +60,9 @@ public:
   void AddClangCXXStdlibIncludeArgs(
       const llvm::opt::ArgList &DriverArgs,
       llvm::opt::ArgStringList &CC1Args) const override;
+  void AddCXXStdlibLibArgs(
+      const llvm::opt::ArgList &Args,
+      llvm::opt::ArgStringList &CmdArgs) const override;
 
   unsigned GetDefaultDwarfVersion() const override { return 2; }
 
