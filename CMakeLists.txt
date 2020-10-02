# Defines the CMake commands/policies
cmake_minimum_required(VERSION 3.12.0)

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

# https://scikit-build.readthedocs.io/en/latest/generators.html#macosx
if(APPLE)
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9")
set(CMAKE_OSX_ARCHITECTURES "x86_64")
# set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6")
# set(CMAKE_OSX_ARCHITECTURES "intel")
endif(APPLE)

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
# numpy<1.15 is from-template and conv-template are not declared as entry points.
# https://scikit-build.readthedocs.io/en/latest/cmake-modules/NumPy.html
# set(NumPy_CONV_TEMPLATE_EXECUTABLE /path/to/python /path/to/site-packages/numpy/distutils/conv_template.py CACHE STRING "Command executing conv-template program" FORCE)
# set(NumPy_FROM_TEMPLATE_EXECUTABLE /path/to/python /path/to/site-packages/numpy/distutils/from_template.py CACHE STRING "Command executing from-template program" FORCE)
# message(STATUS ${NumPy_CONV_TEMPLATE_EXECUTABLE})
# message(STATUS ${NumPy_FROM_TEMPLATE_EXECUTABLE})

list(APPEND EXTERNAL_PKG_INCLUDE ${NumPy_INCLUDE_DIRS})

# examples defines
# find_package(PCL 1.7 REQUIRED)
# message(STATUS ${PCL_INCLUDE_DIRS})
# message(STATUS ${PCL_LIBRARY_DIRS})
# message(STATUS ${PCL_DEFINITIONS})
# message(STATUS ${PCL_LIBRARIES})
list(APPEND EXTERNAL_PKG_INCLUDE ${PCL_INCLUDE_DIRS})
list(APPEND EXTERNAL_PKG_LIBRARYDIR ${PCL_LIBRARY_DIRS})
list(APPEND EXTERNAL_PKG_LIBRARIES ${PCL_LIBRARIES})
list(APPEND EXTERNAL_PKG_DEFINITIONS ${PCL_DEFINITIONS})

# cmake 3.12(MacOSX)
# brefore set: brew install libomp
# find_package(OpenMP REQUIRED)
# if(OpenMP_CXX_FOUND)
#     list(APPEND EXTERNAL_PKG_LIBRARIES OpenMP::OpenMP_CXX)
# endif()
# https://cliutils.gitlab.io/modern-cmake/chapters/packages/OpenMP.html
# https://iscinumpy.gitlab.io/post/omp-on-high-sierra/
# if(NOT TARGET OpenMP::OpenMP_CXX)
#     add_library(OpenMP_TARGET INTERFACE)
#     add_library(OpenMP::OpenMP_CXX ALIAS OpenMP_TARGET)
#     target_compile_options(OpenMP_TARGET INTERFACE ${OpenMP_CXX_FLAGS})
#     find_package(Threads REQUIRED)
#     target_link_libraries(OpenMP_TARGET INTERFACE Threads::Threads)
#     target_link_libraries(OpenMP_TARGET INTERFACE ${OpenMP_CXX_FLAGS})
# endif()
# target_link_libraries(MyTarget PUBLIC OpenMP::OpenMP_CXX)

# load the module to use pkg-config
# find_package(PkgConfig)

# set once(override)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include ${EXTERNAL_PKG_INCLUDE})
link_directories(${EXTERNAL_PKG_LIBRARYDIR})
add_definitions(${EXTERNAL_PKG_DEFINITIONS})

# Process the CMakeLists.txt in the 'temp' directory.
#add_subdirectory(temp)
add_subdirectory(src/temp)
