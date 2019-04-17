# Defines the CMake commands/policies
cmake_minimum_required(VERSION 3.5.0)

# Set the project name
project(template)

# skbuild
# Reference : 
# https://buildmedia.readthedocs.org/media/pdf/scikit-build/latest/scikit-build.pdf
find_package(PythonInterp)
find_package(PythonLibs)
find_package(PythonExtensions)
find_package(Cython)

set(EXTERNAL_MODULE_PATH "")
list(APPEND EXTERNAL_MODULE_PATH $ENV{PCL_ROOT}/cmake)

# Make the scripts available in the 'cmake' directory available for the
# 'include()' command, 'find_package()' command.
# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake" ${EXTERNAL_MODULE_PATH})
# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${EXTERNAL_MODULE_PATH})
set(CMAKE_MODULE_PATH ${EXTERNAL_MODULE_PATH} ${CMAKE_MODULE_PATH})

set(EXTERNAL_PKG_INCLUDE "")
set(EXTERNAL_PKG_LIBRARYDIR "")
set(EXTERNAL_PKG_LIBRARIES "")
set(EXTERNAL_PKG_DEFINITIONS "")

find_package(NumPy REQUIRED)
# message(STATUS ${NumPy_FOUND})
# message(STATUS ${NumPy_INCLUDE_DIRS})
# message(STATUS ${NumPy_VERSION})
list(APPEND EXTERNAL_PKG_INCLUDE ${NumPy_INCLUDE_DIRS})

# examples defines
find_package(PCL 1.7 REQUIRED)
# message(STATUS ${PCL_INCLUDE_DIRS})
# message(STATUS ${PCL_LIBRARY_DIRS})
# message(STATUS ${PCL_DEFINITIONS})
# message(STATUS ${PCL_LIBRARIES})
list(APPEND EXTERNAL_PKG_INCLUDE ${PCL_INCLUDE_DIRS})
list(APPEND EXTERNAL_PKG_LIBRARYDIR ${PCL_LIBRARY_DIRS})
list(APPEND EXTERNAL_PKG_LIBRARIES ${PCL_LIBRARIES})
list(APPEND EXTERNAL_PKG_DEFINITIONS ${PCL_DEFINITIONS})

# find_package(OpenMP QUIET)
# if (OPENMP_FOUND)
#     message(STATUS "Using installed OpenMP ${OpenMP_VERSION}")
#     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
#     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
#     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
# else ()
#     message(STATUS "OpenMP NOT found")
# endif ()

# load the module to use pkg-config
# find_package(PkgConfig)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include ${EXTERNAL_PKG_INCLUDE})
link_directories(${EXTERNAL_PKG_LIBRARYDIR})
add_definitions(${EXTERNAL_PKG_DEFINITIONS})

# Process the CMakeLists.txt in the 'temp' directory.
add_subdirectory( temp )