#! /bin/bash

old_dir=$(pwd)

mkdir -p build
cd build
cmake ../lua

cmake --build .

mkdir -p ${old_dir}/lib
mv liblua.so ${old_dir}/lib

cd $old_dir
rm -fr build
