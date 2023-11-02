#!/bin/bash

# Install project dependencies
python3 -m pip install -r requirements.txt

# Check if 'jet' argument is given
if [ "$1" == "jet" ]; then
    # Uninstall torch and torchvision
    python3 -m pip uninstall torch torchvision

    # Install additional dependencies for 'jet'
    sudo apt-get -y update
    sudo apt-get -y install autoconf bc build-essential g++-8 gcc-8 clang-8 lld-8 gettext-base gfortran-8 iputils-ping libbz2-dev libc++-dev libcgal-dev libffi-dev libfreetype6-dev libhdf5-dev libjpeg-dev liblzma-dev libncurses5-dev libncursesw5-dev libpng-dev libreadline-dev libssl-dev libsqlite3-dev libxml2-dev libxslt-dev locales moreutils openssl python-openssl rsync scons python3-pip libopenblas-dev

    # Install NVIDIA PyTorch for 'jet'
    export TORCH_INSTALL=https://developer.download.nvidia.cn/compute/redist/jp/v511/pytorch/torch-2.0.0+nv23.05-cp38-cp38-linux_aarch64.whl
    python3 -m pip install --upgrade pip
    export LD_LIBRARY_PATH=/usr/lib/llvm-8/lib:$LD_LIBRARY_PATH
    python3 -m pip install --upgrade protobuf
    python3 -m pip install --no-cache $TORCH_INSTALL

    # Clone and install PyTorch/vision for 'jet'
    git clone --recursive --branch v0.15.1 https://github.com/pytorch/vision ~/Downloads/vision --depth 1
    python3 ~/Downloads/vision/setup.py install --user
fi

