$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveDriver.java.orig	Tue May  7 18:59:13 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveDriver.java	Thu Jul 18 10:36:47 2013
@@ -24,9 +24,11 @@
 import java.sql.Driver;
 import java.sql.DriverPropertyInfo;
 import java.sql.SQLException;
+import java.sql.SQLFeatureNotSupportedException;
 import java.util.Properties;
 import java.util.jar.Attributes;
 import java.util.jar.Manifest;
+import java.util.logging.Logger;
 import java.util.regex.Pattern;
 /**
  * HiveDriver.
@@ -166,6 +168,11 @@
     return HiveDriver.getMinorDriverVersion();
   }
 
+  public Logger getParentLogger() throws SQLFeatureNotSupportedException {
+    // JDK 1.7
+    throw new SQLFeatureNotSupportedException("Method not supported");
+  }
+
   public DriverPropertyInfo[] getPropertyInfo(String url, Properties info) throws SQLException {
     if (info == null) {
       info = new Properties();
