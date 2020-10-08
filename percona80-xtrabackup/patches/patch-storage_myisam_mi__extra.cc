$NetBSD$

Fix build on illumos.

--- storage/myisam/mi_extra.cc.orig	2020-08-28 21:02:32.000000000 +0000
+++ storage/myisam/mi_extra.cc
@@ -251,8 +251,13 @@ int mi_reset(MI_INFO *info) {
   if (share->base.blobs) mi_alloc_rec_buff(info, -1, &info->rec_buff);
 #if defined(HAVE_MADVISE)
   if (info->opt_flag & MEMMAP_USED)
+# ifdef __sun
+    posix_madvise((char *)share->file_map, share->state.state.data_file_length,
+            MADV_RANDOM);
+# else
     madvise((char *)share->file_map, share->state.state.data_file_length,
             MADV_RANDOM);
+# endif
 #endif
   info->opt_flag &= ~(KEY_READ_USED | REMEMBER_OLD_POS);
   info->quick_mode = false;
