# 要求 cmake 最低版本
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

# 设置工程名
project(c_skill)

# 自定义变量
set(INCLUDE_DIR ${PROJECT_SOURCE_DIR}/../lua)
set(LINK_DIR ${PROJECT_SOURCE_DIR}/..)
set(LIBS lua m dl vector)

# 设定编译选项
set(CMAKE_C_FLAGS "-g -Wall")
set(CMAKE_C_FLAGS_DEBUG "-g -Wall -D_DEBUG")
set(CMAKE_C_FLAGS_RELEASE "-Wall -DNDEBUG")

# 设定头文件包含目录
include_directories(${INCLUDE_DIR})

# 设定链接目录
link_directories(${LINK_DIR})

# 设定项目文件（递归搜索）
file(GLOB_RECURSE SRC_FILES
    ${PROJECT_SOURCE_DIR}/src/main.cpp)

add_library(vector SHARED ${PROJECT_SOURCE_DIR}/src/vector.cpp)

# 设定可执行程序及生成它依赖的文件
add_executable(main ${SRC_FILES})

# 设定可执行程序依赖的库
target_link_libraries(main ${LIBS})
