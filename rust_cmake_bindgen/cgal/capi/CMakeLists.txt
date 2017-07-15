project(cgal-capi)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(CGAL REQUIRED COMPONENTS Core)
include_directories(${CGAL_INCLUDE_DIRS})
include(${CGAL_USE_FILE})
set(LIBS ${LIBS} ${CGAL_LIBRARIES})

set(SRC_LIST
  x_monotone_curve.cpp
)
add_library(${PROJECT_NAME} STATIC ${SRC_LIST})
