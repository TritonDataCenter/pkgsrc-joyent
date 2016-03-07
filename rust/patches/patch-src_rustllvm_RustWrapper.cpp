$NetBSD$

Support C API difference in LLVM 3.7.0.

--- src/rustllvm/RustWrapper.cpp.orig	2016-03-03 01:03:46.000000000 +0000
+++ src/rustllvm/RustWrapper.cpp
@@ -987,7 +987,15 @@ LLVMRustBuildLandingPad(LLVMBuilderRef B
                         unsigned NumClauses,
                         const char* Name,
                         LLVMValueRef F) {
+#if (LLVM_VERSION_MAJOR == 3 && LLVM_VERSION_MINOR == 7 && LLVM_VERSION_PATCH == 0)
+    if (PersFn)
+        unwrap(Builder)->GetInsertBlock()
+                       ->getParent()
+                       ->setPersonalityFn(cast<Function>(unwrap(PersFn)));
+    return LLVMBuildLandingPad(Builder, Ty, NumClauses, Name);
+#else
     return LLVMBuildLandingPad(Builder, Ty, PersFn, NumClauses, Name);
+#endif
 }
 
 extern "C" LLVMValueRef
