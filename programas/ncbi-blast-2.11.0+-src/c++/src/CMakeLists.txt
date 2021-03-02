#############################################################################
# $Id: CMakeLists.txt 617723 2020-10-06 07:10:56Z blastadm $
#############################################################################

cmake_minimum_required(VERSION 3.7)
if ("${PROJECT_NAME}" STREQUAL "")
    project(ncbi_cpp)
endif()
include(${CMAKE_CURRENT_LIST_DIR}/build-system/cmake/CMakeLists.top_builddir.txt)
