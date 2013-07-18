$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveQueryResultSet.java.orig	Tue May  7 18:59:13 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveQueryResultSet.java	Thu Jul 18 10:36:47 2013
@@ -274,4 +274,13 @@
     return fetchSize;
   }
 
+  public <T> T getObject(String columnLabel, Class<T> type)  throws SQLException {
+    //JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
+  public <T> T getObject(int columnIndex, Class<T> type)  throws SQLException {
+    //JDK 1.7
+    throw new SQLException("Method not supported");
+  }
 }
