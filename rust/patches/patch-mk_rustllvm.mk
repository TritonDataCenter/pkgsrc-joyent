$NetBSD$

Avoid double slashes, confuses cwrappers.

--- mk/rustllvm.mk.orig	2016-03-03 01:03:46.000000000 +0000
+++ mk/rustllvm.mk
@@ -47,10 +47,15 @@ $$(RT_OUTPUT_DIR_$(1))/$$(call CFG_STATI
 # start with a '/'. The shell we're running in will auto-translate the argument
 # `/foo` to `C:/msys64/foo` but we really want it to be passed through as `/foo`
 # so the argument passed to our shell must be `//foo`.
+ifeq ($$(findstring msvc,$(1)),msvc)
+SUBST_LLVM_CXXFLAGS_$(1) := $$(subst /,//,$$(LLVM_CXXFLAGS_$(1)))
+else
+SUBST_LLVM_CXXFLAGS_$(1) := $$(LLVM_CXXFLAGS_$(1))
+endif
 $(1)/rustllvm/%.o: $(S)src/rustllvm/%.cpp $$(MKFILE_DEPS) $$(LLVM_CONFIG_$(1))
 	@$$(call E, compile: $$@)
 	$$(Q)$$(call CFG_COMPILE_CXX_$(1), $$@,) \
-		$$(subst  /,//,$$(LLVM_CXXFLAGS_$(1))) \
+		$$(SUBST_LLVM_CXXFLAGS_$(1)) \
 		$$(EXTRA_RUSTLLVM_CXXFLAGS_$(1)) \
 		$$(RUSTLLVM_INCS_$(1)) \
 		$$<
