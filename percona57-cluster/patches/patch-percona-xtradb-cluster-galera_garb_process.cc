$NetBSD$

Support environ on SunOS.

--- percona-xtradb-cluster-galera/garb/process.cc.orig	2023-08-25 15:06:59.000000000 +0000
+++ percona-xtradb-cluster-galera/garb/process.cc
@@ -40,6 +40,10 @@
 #define WSREP_ERROR printf
 #define WSREP_WARN printf
 
+#ifdef __sun
+extern char **environ;
+#endif
+
 process::process(const char *cmd, const char *type, char **env,
                  bool execute_immediately)
     : str_(cmd ? strdup(cmd) : strdup("")),
