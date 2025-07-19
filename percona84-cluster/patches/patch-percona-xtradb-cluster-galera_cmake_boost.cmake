$NetBSD$

Use same variable as main code.

--- percona-xtradb-cluster-galera/cmake/boost.cmake.orig	2025-05-21 12:54:03.499939002 +0000
+++ percona-xtradb-cluster-galera/cmake/boost.cmake
@@ -13,7 +13,7 @@ if (NOT Boost_FOUND)
   endif()
   message(FATAL_ERROR "Could not find BOOST components")
 else()
-  include_directories(${Boost_INCLUDE_DIRS})
+  include_directories(${Boost_INCLUDE_DIR})
   message(STATUS ${Boost_PROGRAM_OPTIONS_LIBRARIES})
 endif()
 
