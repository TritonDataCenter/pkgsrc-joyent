$NetBSD$

--- libexec/templeton_config.sh.orig	2012-03-02 17:56:20.000000000 +0000
+++ libexec/templeton_config.sh
@@ -20,10 +20,10 @@
 #====================================
 
 # The file containing the running pid
-PID_FILE=./templeton.pid
+PID_FILE=@TEMPLETON_PID_DIR@/templeton.pid
 
 #default log directory
-TEMPLETON_LOG_DIR=${TEMPLETON_LOG_DIR:-.}
+TEMPLETON_LOG_DIR=${TEMPLETON_LOG_DIR:-@TEMPLETON_LOG_DIR@}
 
 # The console error log
 ERROR_LOG=${TEMPLETON_LOG_DIR}/templeton-console-error.log
@@ -32,7 +32,7 @@ ERROR_LOG=${TEMPLETON_LOG_DIR}/templeton
 CONSOLE_LOG=${TEMPLETON_LOG_DIR}/templeton-console.log
 
 # The name of the templeton jar file
-TEMPLETON_JAR=templeton-0.1.0-dev.jar
+TEMPLETON_JAR=@PKGNAME@.jar
 
 # How long to wait before testing that the process started correctly
 SLEEP_TIME_AFTER_START=10
@@ -61,7 +61,7 @@ fi
 if [ -e "${TEMPLETON_PREFIX}/conf/templeton-env.sh" ]; then
   DEFAULT_CONF_DIR=${TEMPLETON_PREFIX}/"conf"
 else
-  DEFAULT_CONF_DIR="/etc/templeton"
+  DEFAULT_CONF_DIR="@PKG_SYSCONFDIR@"
 fi
 TEMPLETON_CONF_DIR="${TEMPLETON_CONF_DIR:-$DEFAULT_CONF_DIR}"
 
