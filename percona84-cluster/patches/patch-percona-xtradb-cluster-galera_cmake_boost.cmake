$NetBSD$

Use same variable as main code.

--- percona-xtradb-cluster-galera/cmake/boost.cmake.orig	2026-04-06 20:08:00.000000000 +0000
+++ percona-xtradb-cluster-galera/cmake/boost.cmake
@@ -4,7 +4,7 @@
 
 set(Boost_USE_MULTITHREAD ON)
 set(Boost_USE_STATIC_LIBS ${GALERA_STATIC})
-find_package(Boost 1.41 COMPONENTS program_options)
+set(Boost_FOUND TRUE)
 if (NOT Boost_FOUND)
   if (Boost_USE_STATIC_LIBS)
     message(ERROR
@@ -13,7 +13,7 @@ if (NOT Boost_FOUND)
   endif()
   message(FATAL_ERROR "Could not find BOOST components")
 else()
-  include_directories(${Boost_INCLUDE_DIRS})
+  include_directories(${BOOST_INCLUDE_DIR})
   message(STATUS "Found Boost program options library: ${Boost_PROGRAM_OPTIONS_LIBRARY}")
 endif()
 
