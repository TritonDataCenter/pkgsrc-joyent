$NetBSD$

--- jdk/test/java/lang/management/OperatingSystemMXBean/GetSystemLoadAverage.java.orig	2013-02-20 17:07:30.000000000 +0000
+++ jdk/test/java/lang/management/OperatingSystemMXBean/GetSystemLoadAverage.java
@@ -103,6 +103,8 @@ public class GetSystemLoadAverage {
                 ? output.split(" ")
                 : output.split(",");
         double expected = Double.parseDouble(lavg[0]);
+        // round to value to two decimals; some OSes report more (SmartOS at least)
+        expected = 0.01D * Math.round(expected / 0.01D);
         double lowRange = expected * (1 - DELTA);
         double highRange = expected * (1 + DELTA);
 
