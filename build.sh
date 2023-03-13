#!/bin/bash

set -o errexit
workdir=$(pwd)

############################################################
## step 1: unzip source code
############################################################
tar -zxf ./bochs-2.7.tar.gz
cd ./bochs-2.7

############################################################
## step 2: 运行 configure，设置编译选项
############################################################

# 不使用 --enable-plugins, 因为编译出来的文件一旦运行就会 core dump

# 不使用 --enable-cpp, 这是给老版本Windows C++ 编译器的选项, 参见
# https://bochs.sourceforge.io/doc/docbook/user/compiling.html

# 使用 --with-term 和 --with-x11 使 bochs 支持 x windows gui 和终端测试
# 如果想使用其他 GUI 库，使用的编译选项参照
# https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html#BOCHSOPT-DISPLAYLIBRARY

./configure --with-term --with-x11 --enable-debugger --enable-all-optimizations --enable-readline --enable-long-phy-address --enable-ltdl-install --enable-idle-hack --enable-a20-pin --enable-x86-64 --enable-smp --enable-cpu-level=6 --enable-large-ramfile --enable-repeat-speedups --enable-fast-function-calls --enable-handlers-chaining --enable-trace-linking --enable-configurable-msrs --enable-show-ips --enable-debugger-gui --enable-iodebug --enable-logging --enable-assert-checks --enable-fpu --enable-vmx=2 --enable-svm --enable-3dnow --enable-alignment-check --enable-monitor-mwait --enable-avx --enable-evex --enable-x86-debugger --enable-pci --enable-usb --enable-voodoo

############################################################
## step 3: 编译bochs
############################################################
make -j

############################################################
## step 4: 运行测试，使用 test_bochsrc 作为测试文件
## 这个测试文件关闭了声音配置，因为会有一个 panic 错误
## 设置BXSHARE 位置是因为这里只编译没有安装，所以需要
## 指定 BIOS 文件的位置
############################################################
export BXSHARE=${workdir}/bochs-2.7/bios

./bochs -f ${workdir}/test_bochsrc
