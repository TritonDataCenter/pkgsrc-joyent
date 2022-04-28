$NetBSD$

Fix building on SunOS in C99 mode.

--- src/hotspot/os/solaris/os_solaris.cpp.orig	2020-05-20 18:29:11.000000000 +0000
+++ src/hotspot/os/solaris/os_solaris.cpp
@@ -1430,7 +1432,9 @@ void * os::dll_load(const char *filename
     {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
     // we only support 64 bit z architecture
     {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
+#ifdef NOT_YET_STILL_BUILDING_ON_OLD_PLATFORMS
     {EM_AARCH64,     EM_AARCH64, ELFCLASS64, ELFDATA2LSB, (char*)"AARCH64"}
+#endif
   };
 
 #if  (defined IA32)
@@ -2134,7 +2138,7 @@ void os::pd_commit_memory_or_exit(char*
 
 // Uncommit the pages in a specified region.
 void os::pd_free_memory(char* addr, size_t bytes, size_t alignment_hint) {
-  if (madvise(addr, bytes, MADV_FREE) < 0) {
+  if (posix_madvise(addr, bytes, MADV_FREE) < 0) {
     debug_only(warning("MADV_FREE failed."));
     return;
   }
@@ -2163,7 +2167,7 @@ void os::pd_realign_memory(char *addr, s
 // Tell the OS to make the range local to the first-touching LWP
 void os::numa_make_local(char *addr, size_t bytes, int lgrp_hint) {
   assert((intptr_t)addr % os::vm_page_size() == 0, "Address should be page-aligned.");
-  if (madvise(addr, bytes, MADV_ACCESS_LWP) < 0) {
+  if (posix_madvise(addr, bytes, MADV_ACCESS_LWP) < 0) {
     debug_only(warning("MADV_ACCESS_LWP failed."));
   }
 }
@@ -2171,7 +2175,7 @@ void os::numa_make_local(char *addr, siz
 // Tell the OS that this range would be accessed from different LWPs.
 void os::numa_make_global(char *addr, size_t bytes) {
   assert((intptr_t)addr % os::vm_page_size() == 0, "Address should be page-aligned.");
-  if (madvise(addr, bytes, MADV_ACCESS_MANY) < 0) {
+  if (posix_madvise(addr, bytes, MADV_ACCESS_MANY) < 0) {
     debug_only(warning("MADV_ACCESS_MANY failed."));
   }
 }
