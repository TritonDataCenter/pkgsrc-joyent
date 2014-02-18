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
@@ -451,9 +451,9 @@ typedef	struct fil_system_struct	fil_sys
 
 struct fil_system_struct {
 #ifndef UNIV_HOTBACKUP
-	mutex_t		mutex;		/*!< The mutex protecting the cache */
+	this_mutex_t		mutex;		/*!< The mutex protecting the cache */
 #ifdef XTRADB_BASED
-	mutex_t		file_extend_mutex;
+	this_mutex_t		file_extend_mutex;
 #endif
 #endif /* !UNIV_HOTBACKUP */
 	hash_table_t*	spaces;		/*!< The hash table of spaces in the
