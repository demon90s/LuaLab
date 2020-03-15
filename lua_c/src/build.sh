#! /bin/bash

cd ..
mkdir -p build

cd build

cmake ..

make

cp libcfunc.so ../src/cfunc.so

# then try 'lua main.lua'