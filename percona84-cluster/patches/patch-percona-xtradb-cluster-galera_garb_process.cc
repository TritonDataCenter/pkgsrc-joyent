$NetBSD$

Find environ correctly.

--- percona-xtradb-cluster-galera/garb/process.cc.orig	2020-09-30 16:36:49.000000000 +0000
+++ percona-xtradb-cluster-galera/garb/process.cc
@@ -40,6 +40,8 @@
 #define WSREP_ERROR printf
 #define WSREP_WARN printf
 
+extern char **environ;
+
 process::process(const char *cmd, const char *type, char **env,
                  bool execute_immediately)
     : str_(cmd ? strdup(cmd) : strdup("")),
