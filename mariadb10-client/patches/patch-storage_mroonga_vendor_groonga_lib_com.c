$NetBSD$

Use POSIX types only.
--- storage/mroonga/vendor/groonga/lib/com.c.orig	2015-02-25 15:40:55.000000000 +0000
+++ storage/mroonga/vendor/groonga/lib/com.c
@@ -351,7 +351,7 @@ grn_com_event_add(grn_ctx *ctx, grn_com_
     struct epoll_event e;
     memset(&e, 0, sizeof(struct epoll_event));
     e.data.fd = (fd);
-    e.events = (__uint32_t) events;
+    e.events = (uint32_t) events;
     if (epoll_ctl(ev->epfd, EPOLL_CTL_ADD, (fd), &e) == -1) {
       SERR("epoll_ctl");
       return ctx->rc;
@@ -399,7 +399,7 @@ grn_com_event_mod(grn_ctx *ctx, grn_com_
       struct epoll_event e;
       memset(&e, 0, sizeof(struct epoll_event));
       e.data.fd = (fd);
-      e.events = (__uint32_t) events;
+      e.events = (uint32_t) events;
       if (epoll_ctl(ev->epfd, EPOLL_CTL_MOD, (fd), &e) == -1) {
         SERR("epoll_ctl");
         return ctx->rc;
