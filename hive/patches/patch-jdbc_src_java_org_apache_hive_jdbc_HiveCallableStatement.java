$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveCallableStatement.java.orig	Tue May  7 18:59:13 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveCallableStatement.java	Thu Jul 18 10:36:47 2013
@@ -462,6 +462,16 @@
     throw new SQLException("Method not supported");
   }
 
+  public <T> T getObject(int parameterIndex, Class<T> type) throws SQLException {
+    // TODO JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
+  public <T> T getObject(String parameterName, Class<T> type) throws SQLException {
+    // TODO JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
@@ -2029,6 +2039,16 @@
     // TODO Auto-generated method stub
     throw new SQLException("Method not supported");
   }
+
+  public void closeOnCompletion() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
+  public boolean isCloseOnCompletion() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
 
   /*
    * (non-Javadoc)
