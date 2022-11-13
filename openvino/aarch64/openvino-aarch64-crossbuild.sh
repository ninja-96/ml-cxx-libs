#! /bin/bash

if [[ $1 == "" ]]; then
    echo "Usage ./openvino-aarch64-crossbuild.sh <openvino version> <openvino_contrib version>"
    exit 1
fi

if [[ $2 == "" ]]; then
    echo "Usage ./openvino-aarch64-crossbuild.sh <openvino version> <openvino_contrib version>"
    exit 1
fi

git clone -b $1 --recurse-submodule --depth 1 https://github.com/openvinotoolkit/openvino.git;
git clone -b $2 --recurse-submodule --depth 1 https://github.com/openvinotoolkit/openvino_contrib.git;

src_path="$(pwd)"

mkdir ./openvino-aarch64-build;
cd ./openvino-aarch64-build;

cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$src_path/openvino/cmake/arm64.toolchain.cmake \
    -DIE_EXTRA_MODULES=$src_path/openvino_contrib/modules \
    -DENABLE_PYTHON=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DTHREADING=SEQ \
    -DBUILD_java_api=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=$src_path/openvino-$1-aarch64 \
    $src_path/openvino;

make -j$(nproc);
make install;
