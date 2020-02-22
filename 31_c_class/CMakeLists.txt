# 要求 cmake 最低版本
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

# 设置工程名
project(main)

# 自定义变量
set(INCLUDE_DIR ${PROJECT_SOURCE_DIR}/../include)
set(LINK_DIR ${PROJECT_SOURCE_DIR}/../lib)

if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    # Linux
	set(LIBNAME vector)
	set(LIBS lua m dl ${LIBNAME})
elseif (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # MacOS
elseif (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    # Windows
	set(LIBNAME libvector)
	set(LIBS lua ${LIBNAME})
endif()

# 设定头文件包含目录
include_directories(${INCLUDE_DIR})

# 设定链接目录
link_directories(${LINK_DIR})

# 设定项目文件（递归搜索）
file(GLOB_RECURSE SRC_FILES
    ${PROJECT_SOURCE_DIR}/src/main.cpp
    ${PROJECT_SOURCE_DIR}/src/main.lua
    ${PROJECT_SOURCE_DIR}/vector.hpp)

set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR})
file(GLOB_RECURSE LIB_SRC_FILES
    ${PROJECT_SOURCE_DIR}/src/*vector*)
add_library(${LIBNAME} SHARED ${LIB_SRC_FILES})
target_compile_definitions(${LIBNAME} PRIVATE -DMAKE_DLL)
target_link_libraries(${LIBNAME} lua)

# 设定可执行程序及生成它依赖的文件
add_executable(main ${SRC_FILES})

# 设定可执行程序依赖的库
target_link_libraries(main ${LIBS})
