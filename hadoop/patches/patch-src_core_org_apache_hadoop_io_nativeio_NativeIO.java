$NetBSD$

Set file system flags as per sys/fcntl.h on SunOS.
(This may need to be conditioned to to cater to Linux and BSD.)
--- src/core/org/apache/hadoop/io/nativeio/NativeIO.java.orig	2012-05-08 20:34:52.000000000 +0000
+++ src/core/org/apache/hadoop/io/nativeio/NativeIO.java
@@ -37,13 +37,13 @@ public class NativeIO {
   public static final int O_RDONLY   =    00;
   public static final int O_WRONLY   =    01;
   public static final int O_RDWR     =    02;
-  public static final int O_CREAT    =  0100;
-  public static final int O_EXCL     =  0200;
-  public static final int O_NOCTTY   =  0400;
+  public static final int O_CREAT    =  0400;
+  public static final int O_EXCL     = 02000;
+  public static final int O_NOCTTY   = 04000;
   public static final int O_TRUNC    = 01000;
-  public static final int O_APPEND   = 02000;
-  public static final int O_NONBLOCK = 04000;
-  public static final int O_SYNC   =  010000;
+  public static final int O_APPEND   =   010;
+  public static final int O_NONBLOCK =  0200;
+  public static final int O_SYNC   =     020;
   public static final int O_ASYNC  =  020000;
   public static final int O_FSYNC = O_SYNC;
   public static final int O_NDELAY = O_NONBLOCK;
