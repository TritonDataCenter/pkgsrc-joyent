$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HivePreparedStatement.java.orig	Tue May  7 18:59:13 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HivePreparedStatement.java	Thu Jul 18 10:36:47 2013
@@ -858,6 +858,11 @@
      warningChain=null;
   }
 
+  public void closeOnCompletion() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /**
    *  Closes the prepared statement.
    *
@@ -1154,6 +1159,11 @@
     return isClosed;
   }
 
+  public boolean isCloseOnCompletion() throws SQLException {
+    //JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
