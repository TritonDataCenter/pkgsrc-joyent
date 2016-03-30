$NetBSD$

Disable Darwin-specific bits.

--- cmake/install_macros.cmake.orig	2014-11-25 06:30:35.000000000 +0000
+++ cmake/install_macros.cmake
@@ -13,7 +13,7 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
 
-if(APPLE)
+if(notAPPLE)
  LIST(APPEND CMAKE_CXX_LINK_EXECUTABLE "dsymutil <TARGET>")
  LIST(APPEND CMAKE_C_LINK_EXECUTABLE "dsymutil <TARGET>")
  LIST(APPEND CMAKE_CXX_CREATE_SHARED_LIBRARY "dsymutil <TARGET>")
@@ -25,7 +25,7 @@ ENDIF()
 GET_FILENAME_COMPONENT(MYSQL_CMAKE_SCRIPT_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
 INCLUDE(${MYSQL_CMAKE_SCRIPT_DIR}/cmake_parse_arguments.cmake)
 MACRO (INSTALL_DSYM_DIRECTORIES targets)
-  IF(APPLE)
+  IF(notAPPLE)
     FOREACH(target ${targets})
       GET_TARGET_PROPERTY(location ${target} LOCATION)
       GET_TARGET_PROPERTY(type ${target} TYPE)
