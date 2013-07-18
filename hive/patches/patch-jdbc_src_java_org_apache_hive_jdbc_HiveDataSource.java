$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveDataSource.java.orig	Tue May  7 18:59:13 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveDataSource.java	Thu Jul 18 10:36:47 2013
@@ -21,6 +21,8 @@
 import java.io.PrintWriter;
 import java.sql.Connection;
 import java.sql.SQLException;
+import java.sql.SQLFeatureNotSupportedException;
+import java.util.logging.Logger;
 
 import javax.sql.DataSource;
 
@@ -84,6 +86,11 @@
     throw new SQLException("Method not supported");
   }
 
+  public Logger getParentLogger() throws SQLFeatureNotSupportedException {
+    // JDK 1.7
+    throw new SQLFeatureNotSupportedException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    * 
