#! /bin/bash

if [[ $1 == "" ]]; then
    echo "Usage ./libtorch-build.sh <version>"
    exit 1
fi

git clone -b $1 --recurse-submodule --depth 1 https://github.com/pytorch/pytorch.git;

mkdir libtorch-$1-$(arch)-opencl-build;
cd libtorch-$1-$(arch)-opencl-build;

cmake -DUSE_OPENCL:BOOL=ON \
    -DUSE_CUDA:BOOL=OFF \
    -DUSE_VULKAN:BOOL=OFF \
    -DBUILD_PYTHON:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DPYTHON_EXECUTABLE:PATH=`which python3` \
    -DCMAKE_INSTALL_PREFIX:PATH=../libtorch-$1-$(arch)-opencl \
    ../pytorch;

make -j$(nproc);
make install;
