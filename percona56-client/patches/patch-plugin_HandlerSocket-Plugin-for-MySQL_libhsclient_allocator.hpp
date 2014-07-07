$NetBSD$

--- plugin/HandlerSocket-Plugin-for-MySQL/libhsclient/allocator.hpp.orig	2014-07-01 08:51:11.000000000 +0000
+++ plugin/HandlerSocket-Plugin-for-MySQL/libhsclient/allocator.hpp
@@ -9,6 +9,7 @@
 #ifndef DENA_ALLOCATOR_HPP
 #define DENA_ALLOCATOR_HPP
 
+#include <alloca.h>
 #include <stdlib.h>
 #include <string.h>
 
