$NetBSD$

Avoid relocation error.

--- src/llvm/lib/CodeGen/MachineDominanceFrontier.cpp.orig	2016-08-16 01:55:50.000000000 +0000
+++ src/llvm/lib/CodeGen/MachineDominanceFrontier.cpp
@@ -16,7 +16,6 @@
 using namespace llvm;
 
 namespace llvm {
-template class DominanceFrontierBase<MachineBasicBlock>;
 template class ForwardDominanceFrontierBase<MachineBasicBlock>;
 }
 
