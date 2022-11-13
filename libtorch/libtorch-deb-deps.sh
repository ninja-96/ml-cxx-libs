#! /bin/bash

apt update -y;
apt upgrade -y;
apt install build-essential \
    git \
    cmake \
    ocl-icd-opencl-dev \
    ocl-icd-dev \
    mesa-opencl-icd \
    python3-dev \
    python3-yaml \
    python3-typing-extensions \
    python3-setuptools \
    -y;
