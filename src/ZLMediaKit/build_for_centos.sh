#!/bin/sh

cd /home
make -p /home/work/vendor
cd /home/work/vendor

# 1.安装nasm
wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2
tar xvf nasm-2.14.02.tar.bz2
cd nasm-2.14.02
./configure
make && make install

cd /home/work/vendor

# 2.安装x264
git clone git://git.videolan.org/x264.git
cd x264
./configure --enable-shared
make && make install

cd /home/work/vendor

# 3.安装mp4v2
git clone https://github.com/TechSmith/mp4v2.git
cd mp4v2
./configure
make && make install

# 4.安装lame
wget http://jaist.dl.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
tar xvf lame-3.100.tar.gz
cd lame-3.100
./configure
make && make install

cd /home/work/vendor

# 5.安装faac
wget http://jaist.dl.sourceforge.net/project/faac/faac-src/faac-1.29/faac-1.29.9.2.tar.gz
tar xvf faac-1.29.9.2.tar.gz
cd faac-1.29.9.2
./configure
make && make install

cd /home/work/vendor

# 6.安装cmake
wget https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3.tar.gz
tar xvf  cmake-3.14.3.tar.gz
./configure
make && make install

cd /home/work

# 7.cmake编译ZLMediaKit

git clone  --recursive https://github.com/xiongziliang/ZLMediaKit.git

cd ZLMediaKit
mkdir -p linux_build
rm -rf ./build
ln -s ./linux_build build
cd linux_build

cmake ..
make
