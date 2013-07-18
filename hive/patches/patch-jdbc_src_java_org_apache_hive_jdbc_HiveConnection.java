$NetBSD$

Add OpenJDK7 support as per https://issues.apache.org/jira/browse/HIVE-4496
--- jdbc/src/java/org/apache/hive/jdbc/HiveConnection.java.orig	Tue May  7 18:59:21 2013
+++ jdbc/src/java/org/apache/hive/jdbc/HiveConnection.java	Thu Jul 18 10:39:22 2013
@@ -33,6 +33,7 @@
 import java.sql.Savepoint;
 import java.sql.Statement;
 import java.sql.Struct;
+import java.util.concurrent.Executor;
 import java.util.LinkedList;
 import java.util.List;
 import java.util.Map;
@@ -161,28 +162,33 @@
     }
   }
 
-    private void openSession(String uri) throws SQLException {
-      TOpenSessionReq openReq = new TOpenSessionReq();
+  private void openSession(String uri) throws SQLException {
+    TOpenSessionReq openReq = new TOpenSessionReq();
 
-      // set the session configuration
-      // openReq.setConfiguration(null);
+    // set the session configuration
+    // openReq.setConfiguration(null);
 
-      try {
-        TOpenSessionResp openResp = client.OpenSession(openReq);
+    try {
+      TOpenSessionResp openResp = client.OpenSession(openReq);
 
-        // validate connection
-        Utils.verifySuccess(openResp.getStatus());
-        if (!supportedProtocols.contains(openResp.getServerProtocolVersion())) {
-          throw new TException("Unsupported Hive2 protocol");
-        }
-        sessHandle = openResp.getSessionHandle();
-      } catch (TException e) {
-        throw new SQLException("Could not establish connection to "
-            + uri + ": " + e.getMessage(), " 08S01");
+      // validate connection
+      Utils.verifySuccess(openResp.getStatus());
+      if (!supportedProtocols.contains(openResp.getServerProtocolVersion())) {
+        throw new TException("Unsupported Hive2 protocol");
       }
-      isClosed = false;
+      sessHandle = openResp.getSessionHandle();
+    } catch (TException e) {
+      throw new SQLException("Could not establish connection to "
+          + uri + ": " + e.getMessage(), " 08S01", e);
     }
+    isClosed = false;
+  }
 
+  public void abort(Executor executor) throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
@@ -396,6 +402,17 @@
     return new HiveDatabaseMetaData(client, sessHandle);
   }
 
+  public int getNetworkTimeout() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
+
+  public String getSchema() throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
@@ -664,6 +681,11 @@
     throw new SQLException("Method not supported");
   }
 
+  public void setNetworkTimeout(Executor executor, int milliseconds) throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
+
   /*
    * (non-Javadoc)
    *
@@ -696,6 +718,11 @@
     // TODO Auto-generated method stub
     throw new SQLException("Method not supported");
   }
+
+  public void setSchema(String schema) throws SQLException {
+    // JDK 1.7
+    throw new SQLException("Method not supported");
+  }
 
   /*
    * (non-Javadoc)
