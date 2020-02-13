$NetBSD$

Fix build on illumos.

--- sql/resourcegroups/platform/thread_attrs_api_solaris.cc.orig	2019-12-14 16:07:34.000000000 +0000
+++ sql/resourcegroups/platform/thread_attrs_api_solaris.cc
@@ -33,7 +33,7 @@
 
 namespace resourcegroups {
 namespace platform {
-bool is_platform_supported() { return true; }
+bool is_platform_supported() { return false; }
 
 bool bind_to_cpu(cpu_id_t cpu_id) {
   if (processor_bind(P_LWPID, P_MYID, static_cast<processorid_t>(cpu_id),
@@ -60,6 +60,7 @@ bool bind_to_cpu(cpu_id_t cpu_id, my_thr
 }
 
 bool bind_to_cpus(const std::vector<cpu_id_t> &cpu_ids) {
+#if 0
   if (cpu_ids.empty()) return false;
 
   procset_t ps;
@@ -75,11 +76,13 @@ bool bind_to_cpus(const std::vector<cpu_
            my_strerror(errbuf, MYSQL_ERRMSG_SIZE, my_errno()));
     return true;
   }
+#endif
   return false;
 }
 
 bool bind_to_cpus(const std::vector<cpu_id_t> &cpu_ids,
                   my_thread_os_id_t thread_id) {
+#if 0
   procset_t ps;
   uint_t nids = cpu_ids.size();
   id_t *ids = reinterpret_cast<id_t *>(const_cast<unsigned *>(cpu_ids.data()));
@@ -95,10 +98,12 @@ bool bind_to_cpus(const std::vector<cpu_
            my_strerror(errbuf, MYSQL_ERRMSG_SIZE, my_errno()));
     return true;
   }
+#endif
   return false;
 }
 
 bool unbind_thread() {
+#if 0
   procset_t ps;
   uint32_t flags = PA_CLEAR;
 
@@ -111,10 +116,12 @@ bool unbind_thread() {
            my_strerror(errbuf, MYSQL_ERRMSG_SIZE, my_errno()));
     return true;
   }
+#endif
   return false;
 }
 
 bool unbind_thread(my_thread_os_id_t thread_id) {
+#if 0
   procset_t ps;
   uint32_t flags = PA_CLEAR;
 
@@ -127,6 +134,7 @@ bool unbind_thread(my_thread_os_id_t thr
            my_strerror(errbuf, MYSQL_ERRMSG_SIZE, my_errno()));
     return true;
   }
+#endif
   return false;
 }
 
