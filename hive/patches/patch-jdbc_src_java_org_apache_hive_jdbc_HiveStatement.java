$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveStatement.java.orig	Tue May  7 18:59:21 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveStatement.java	Thu Jul 18 10:36:47 2013
@@ -163,6 +163,11 @@
     isClosed = true;
   }
 
+  public void closeOnCompletion() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
@@ -450,6 +455,11 @@
     return isClosed;
   }
 
+  public boolean isCloseOnCompletion() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
