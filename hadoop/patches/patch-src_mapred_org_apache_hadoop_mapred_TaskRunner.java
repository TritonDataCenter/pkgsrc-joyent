$NetBSD$

Introduce a hook where to pass -d64 when 64bit JVM is needed.
--- src/mapred/org/apache/hadoop/mapred/TaskRunner.java.orig	2012-10-03 05:17:19.000000000 +0000
+++ src/mapred/org/apache/hadoop/mapred/TaskRunner.java
@@ -377,6 +377,9 @@ abstract class TaskRunner extends Thread
 
     vargs.add(jvm.toString());
 
+    // Let pkgsrc inject -d64 here in case of a 64bit JVM
+    vargs.add("@JAVA_ARCH_FLAG@");
+
     // Add child (task) java-vm options.
     //
     // The following symbols if present in mapred.{map|reduce}.child.java.opts 
