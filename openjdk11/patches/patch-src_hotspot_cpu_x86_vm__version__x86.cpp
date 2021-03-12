$NetBSD$

SunOS does not support cpu_microcode_revision().

--- src/hotspot/cpu/x86/vm_version_x86.cpp.orig	2020-07-29 16:52:13.000000000 +0000
+++ src/hotspot/cpu/x86/vm_version_x86.cpp
@@ -750,7 +750,12 @@ void VM_Version::get_processor_features(
                "(%u cores per cpu, %u threads per core) family %d model %d stepping %d microcode 0x%x"
                "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
                cores_per_cpu(), threads_per_core(),
-               cpu_family(), _model, _stepping, os::cpu_microcode_revision(),
+               cpu_family(), _model, _stepping,
+#ifdef __sun
+               "",
+#else
+               os::cpu_microcode_revision(),
+#endif
                (supports_cmov() ? ", cmov" : ""),
                (supports_cmpxchg8() ? ", cx8" : ""),
                (supports_fxsr() ? ", fxsr" : ""),
