$NetBSD$

Use directio on SunOS instead of O_DIRECT.
--- storage/tokudb/ft-index/portability/file.cc.orig	2015-02-24 19:09:53.000000000 +0000
+++ storage/tokudb/ft-index/portability/file.cc
@@ -373,6 +373,9 @@ toku_os_open_direct(const char *path, in
             perror("setting F_NOCACHE");
         }
     }
+#elif defined(__sun)
+    rval = toku_os_open(path, oflag, mode);
+    directio(rval, DIRECTIO_ON);
 #else
 # error "No direct I/O implementation found."
 #endif
