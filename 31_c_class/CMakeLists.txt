cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(main)

set(INCLUDE_DIR ${PROJECT_SOURCE_DIR}/../include)
set(LINK_DIR ${PROJECT_SOURCE_DIR}/../lib)

set(CUSTOM_LIB vector)

if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    # Linux
	set(LIBS m dl ${CUSTOM_LIB})
elseif (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # MacOS
elseif (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    # Windows
	set(CUSTOM_LIB lib${CUSTOM_LIB})
	set(LIBS ${CUSTOM_LIB})
endif()

include_directories(${INCLUDE_DIR})

link_directories(${LINK_DIR})

file(GLOB_RECURSE SRC_FILES
    ${PROJECT_SOURCE_DIR}/src/main.cpp
    ${PROJECT_SOURCE_DIR}/src/main.lua
    ${PROJECT_SOURCE_DIR}/vector.hpp)

# lib
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR})
file(GLOB_RECURSE LIB_SRC_FILES
    ${PROJECT_SOURCE_DIR}/src/*vector*)
add_library(${CUSTOM_LIB} SHARED ${LIB_SRC_FILES})
target_compile_definitions(${CUSTOM_LIB} PRIVATE -DMAKE_DLL)
target_link_libraries(${CUSTOM_LIB} lua)

# 设定可执行程序及生成它依赖的文件
add_executable(main ${SRC_FILES})

# 设定可执行程序依赖的库
target_link_libraries(main ${CUSTOM_LIB})
