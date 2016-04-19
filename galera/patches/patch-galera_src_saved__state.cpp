$NetBSD$

Implement fcntl support for SunOS.

--- galera/src/saved_state.cpp.orig	2016-03-12 09:07:22.000000000 +0000
+++ galera/src/saved_state.cpp
@@ -12,6 +12,10 @@
 #include <inttypes.h>
 #include <sys/file.h>
 
+#ifdef __sun
+#include "fcntl.h"
+#endif
+
 namespace galera
 {
 
@@ -31,6 +35,12 @@ SavedState::SavedState  (const std::stri
     total_locks_  (0),
     total_writes_ (0)
 {
+#ifdef __sun
+    struct flock lock;
+    lock.l_start = 0;
+    lock.l_len = 0;
+    lock.l_whence = SEEK_SET;
+#endif
 
     GU_DBUG_EXECUTE("galera_init_invalidate_state",
                     unlink(file.c_str()););
@@ -53,7 +63,12 @@ SavedState::SavedState  (const std::stri
 
     // We take exclusive lock on state file in order to avoid possibility
     // of two Galera replicators sharing the same state file.
+#ifdef __sun
+    lock.l_type = F_WRLCK;
+    if (fcntl(fileno(fs_), F_SETLK, &lock))
+#else
     if (flock(fileno(fs_), LOCK_EX|LOCK_NB))
+#endif
     {
         log_warn << "Could not get exclusive lock on state file: " << file;
         return;
@@ -132,9 +147,21 @@ SavedState::SavedState  (const std::stri
 
 SavedState::~SavedState ()
 {
+#ifdef __sun
+    struct flock lock;
+    lock.l_start = 0;
+    lock.l_len = 0;
+    lock.l_whence = SEEK_SET;
+#endif
+
     if (fs_)
     {
+#ifdef __sun
+        lock.l_type = F_UNLCK;
+        if (fcntl(fileno(fs_), F_GETLK, &lock) != 0)
+#else
         if (flock(fileno(fs_), LOCK_UN) != 0)
+#endif
         {
             log_error << "Could not unlock saved state file.";
         }
