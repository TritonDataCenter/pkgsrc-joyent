$NetBSD$

Patch for Java 7 as per https://reviews.apache.org/r/8106/

--- src/test/com/cloudera/sqoop/testutil/MockResultSet.java.orig	Tue Aug 14 11:21:53 2012
+++ src/test/com/cloudera/sqoop/testutil/MockResultSet.java	Thu Jul 18 09:10:52 2013
@@ -884,7 +884,23 @@
       throws SQLException {
   }
 
+  /* Commenting @override as this is addition in java 7 that is not available
+   * in Java 6
   @Override
+   */
+  public <T> T getObject(int columnIndex, Class<T> type) throws SQLException {
+    return null;
+  }
+
+  /* Commenting @override as this is addition in java 7 that is not available
+   * in Java 6
+  @Override
+   */
+  public <T> T getObject(String columnLabel, Class<T> type) throws SQLException{
+    return null;
+  }
+
+  @Override
   public void updateNClob(int columnIndex, Reader reader, long length)
       throws SQLException {
   }
