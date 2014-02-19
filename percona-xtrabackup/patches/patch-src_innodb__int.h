$NetBSD$

Don't redefine mutex_t.

--- src/innodb_int.h.orig	2014-01-23 14:59:36.000000000 +0000
+++ src/innodb_int.h
@@ -144,7 +144,7 @@ extern "C" {
 	btr_root_block_get(index, mode, mtr)
 #  define xb_file_delete(path) \
 	os_file_delete_func(path)
-   typedef ib_mutex_t	mutex_t;
+   typedef ib_mutex_t	this_mutex_t;
 #  define INNODB_LOG_DIR srv_log_group_home_dir
 #  define DEFAULT_LOG_FILE_SIZE 48*1024*1024
    /* InnoDB data dictionary API in MySQL 5.5- works on on tables named
@@ -451,10 +451,18 @@ typedef	struct fil_system_struct	fil_sys
 
 struct fil_system_struct {
 #ifndef UNIV_HOTBACKUP
+#  if (MYSQL_VERSION_ID >= 50600)
+	this_mutex_t	mutex;		/*!< The mutex protecting the cache */
+#  else
 	mutex_t		mutex;		/*!< The mutex protecting the cache */
+#endif
 #ifdef XTRADB_BASED
+#  if (MYSQL_VERSION_ID >= 50600)
+	this_mutex_t	file_extend_mutex;
+#  else
 	mutex_t		file_extend_mutex;
 #endif
+#endif
 #endif /* !UNIV_HOTBACKUP */
 	hash_table_t*	spaces;		/*!< The hash table of spaces in the
 					system; they are hashed on the space
