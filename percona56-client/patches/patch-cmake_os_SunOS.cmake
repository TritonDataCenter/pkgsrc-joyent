$NetBSD$

Stop this nonsense.

--- cmake/os/SunOS.cmake.orig	2017-02-03 08:02:59.000000000 +0000
+++ cmake/os/SunOS.cmake
@@ -17,33 +17,6 @@ INCLUDE(CheckSymbolExists)
 INCLUDE(CheckCSourceRuns)
 INCLUDE(CheckCSourceCompiles) 
 
-# We require SunStudio 12u2 (CC 5.11)
-IF(NOT FORCE_UNSUPPORTED_COMPILER)
-  IF(CMAKE_C_COMPILER_ID MATCHES "SunPro")
-    # CC -V yields
-    # CC: Studio 12.5 Sun C++ 5.14 SunOS_sparc Dodona 2016/04/04
-    # CC: Sun C++ 5.13 SunOS_sparc Beta 2014/03/11
-    # CC: Sun C++ 5.11 SunOS_sparc 2010/08/13
-    EXECUTE_PROCESS(
-      COMMAND ${CMAKE_CXX_COMPILER} "-V"
-      OUTPUT_VARIABLE stdout
-      ERROR_VARIABLE  stderr
-      RESULT_VARIABLE result
-    )
-    STRING(REGEX MATCH "CC: Sun C\\+\\+ 5\\.([0-9]+)" VERSION_STRING ${stderr})
-    IF (NOT CMAKE_MATCH_1 OR CMAKE_MATCH_1 STREQUAL "")
-      STRING(REGEX MATCH "CC: Studio 12\\.5 Sun C\\+\\+ 5\\.([0-9]+)"
-        VERSION_STRING ${stderr})
-    ENDIF()
-    SET(CC_MINOR_VERSION ${CMAKE_MATCH_1})
-    IF(${CC_MINOR_VERSION} LESS 11)
-      MESSAGE(FATAL_ERROR "SunStudio 12u2 or newer is required!")
-    ENDIF()
-  ELSE()
-    MESSAGE(FATAL_ERROR "Unsupported compiler!")
-  ENDIF()
-ENDIF()
-
 # Enable 64 bit file offsets
 SET(_FILE_OFFSET_BITS 64)
 
