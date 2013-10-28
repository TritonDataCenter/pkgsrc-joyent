$NetBSD$

Support giflib 5.x

--- src/gifio.c.orig	2012-01-22 18:29:15.000000000 +0000
+++ src/gifio.c
@@ -100,7 +100,11 @@ SavedImage       si;
     _lseek(fd, 0, SEEK_SET);
 #endif  /* _MSC_VER */
 
+#if GIFLIB_MAJOR < 5
     if ((gif = DGifOpenFileHandle(fd)) == NULL)
+#else
+    if ((gif = DGifOpenFileHandle(fd, NULL)) == NULL)
+#endif
         return (PIX *)ERROR_PTR("invalid file or file not found",
                                 procName, NULL);
 
@@ -316,6 +320,10 @@ GifByteType     *gif_line;
     }
 
         /* Save the cmap colors in a gif_cmap */
+#if GIFLIB_MAJOR >= 5
+#define MakeMapObject GifMakeMapObject
+#define FreeMapObject GifFreeMapObject
+#endif
     if ((gif_cmap = MakeMapObject(gif_ncolor, NULL)) == NULL) {
         pixDestroy(&pixd);
         return ERROR_INT("failed to create GIF color map", procName, 1);
@@ -337,7 +345,11 @@ GifByteType     *gif_line;
     }
 
         /* Get the gif file handle */
+#if GIFLIB_MAJOR < 5
     if ((gif = EGifOpenFileHandle(fd)) == NULL) {
+#else
+    if ((gif = EGifOpenFileHandle(fd, NULL)) == NULL) {
+#endif
         pixDestroy(&pixd);
         FreeMapObject(gif_cmap);
         return ERROR_INT("failed to create GIF image handle", procName, 1);
