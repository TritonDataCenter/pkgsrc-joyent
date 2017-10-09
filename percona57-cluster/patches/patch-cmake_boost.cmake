$NetBSD: patch-cmake_boost.cmake,v 1.6 2017/09/13 17:34:41 adam Exp $

Bypass bundled Boost bits and ignore system Boost version.

--- cmake/boost.cmake.orig	2017-09-22 12:46:54.000000000 +0000
+++ cmake/boost.cmake
@@ -262,20 +262,13 @@ IF(NOT BOOST_MAJOR_VERSION EQUAL 10)
   COULD_NOT_FIND_BOOST()
 ENDIF()
 
-IF(NOT BOOST_MINOR_VERSION EQUAL 59)
-  MESSAGE(WARNING "Boost minor version found is ${BOOST_MINOR_VERSION} "
-    "we need 59"
-    )
-  COULD_NOT_FIND_BOOST()
-ENDIF()
-
 MESSAGE(STATUS "BOOST_INCLUDE_DIR ${BOOST_INCLUDE_DIR}")
 
 # We have a limited set of patches/bugfixes here:
-SET(BOOST_PATCHES_DIR "${CMAKE_SOURCE_DIR}/include/boost_1_59_0/patches")
+SET(BOOST_PATCHES_DIR "${CMAKE_SOURCE_DIR}/include/boost_1_59_0_off/patches")
 
 # We have a limited set of source files here:
-SET(BOOST_SOURCES_DIR "${CMAKE_SOURCE_DIR}/include/boost_1_59_0")
+SET(BOOST_SOURCES_DIR "${CMAKE_SOURCE_DIR}/include/boost_1_59_0_off")
 
 # Bug in sqrt(NaN) on 32bit platforms
 IF(SIZEOF_VOIDP EQUAL 4)
