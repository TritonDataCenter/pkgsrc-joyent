$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveDatabaseMetaData.java.orig	Tue May  7 18:59:21 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveDatabaseMetaData.java	Thu Jul 18 10:36:47 2013
@@ -144,6 +144,17 @@
     throw new SQLException("Method not supported");
   }
 
+  public ResultSet getPseudoColumns(String catalog, String schemaPattern,
+      String tableNamePattern, String columnNamePattern) throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
+  public boolean generatedKeyAlwaysReturned() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /**
    * Convert a pattern containing JDBC catalog search wildcards into
    * Java regex patterns.
@@ -709,6 +720,16 @@
       public boolean next() throws SQLException {
         return false;
       }
+
+      public <T> T getObject(String columnLabel, Class<T> type) throws SQLException {
+        // JDK 1.7
+        throw new SQLException("Method not supported");
+      }
+
+      public <T> T getObject(int columnIndex, Class<T> type) throws SQLException {
+        // JDK 1.7
+        throw new SQLException("Method not supported");
+        }
     };
   }
 
