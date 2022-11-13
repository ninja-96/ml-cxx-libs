#! /bin/bash

apt update -y;
dpkg --add-architecture arm64;
apt update -y;

apt upgrade -y; 
apt install --no-install-recommends \
    build-essential \
    crossbuild-essential-arm64 \
    git \
    wget \
    libusb-1.0-0-dev:arm64 \
    libgtk-3-dev:arm64 \
    libavcodec-dev:arm64 \
    libavformat-dev:arm64 \
    libswscale-dev:arm64 \
    libgstreamer1.0-dev:arm64 \
    libgstreamer-plugins-base1.0-dev:arm64 \
    libpython3-dev:arm64 \
    python3-pip \
    python3-minimal \
    scons \
    python3-numpy \
    cython3 \
    shellcheck \
    cmake \
    ocl-icd-opencl-dev:arm64 \
    ocl-icd-dev:arm64 \
    mesa-opencl-icd:arm64 \
    libopencv-dev:arm64 \
    -y;
