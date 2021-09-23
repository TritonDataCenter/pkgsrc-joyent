$NetBSD$

Bring in O_DIRECTORY compat from the gcc9 branch.

--- libsanitizer/sanitizer_common/sanitizer_linux.cpp.orig	2021-09-01 10:28:37.000000000 +0000
+++ libsanitizer/sanitizer_common/sanitizer_linux.cpp
@@ -900,7 +900,17 @@ ThreadLister::ThreadLister(pid_t pid) :
   char task_directory_path[80];
   internal_snprintf(task_directory_path, sizeof(task_directory_path),
                     "/proc/%d/task/", pid);
+#ifdef O_DIRECTORY
   descriptor_ = internal_open(task_directory_path, O_RDONLY | O_DIRECTORY);
+#else
+  struct stat st;
+  stat(task_directory_path, &st);
+  if (S_ISDIR(st.st_mode)) {
+    descriptor_ = internal_open(task_directory_path, O_RDONLY);
+  } else {
+    descriptor_ = (uptr)-1; // Set error value defined in internal_iserror
+  }
+#endif
   if (internal_iserror(descriptor_)) {
     Report("Can't open /proc/%d/task for reading.\n", pid);
   }
