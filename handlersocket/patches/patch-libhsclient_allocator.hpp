$NetBSD$

--- libhsclient/allocator.hpp.orig	2012-05-01 12:09:31.000000000 +0000
+++ libhsclient/allocator.hpp
@@ -9,6 +9,7 @@
 #ifndef DENA_ALLOCATOR_HPP
 #define DENA_ALLOCATOR_HPP
 
+#include <alloca.h>
 #include <stdlib.h>
 #include <string.h>
 
