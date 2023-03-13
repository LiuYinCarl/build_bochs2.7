#!/bin/bash

set -o errexit

############################################################
## step 1: unzip source code
############################################################
tar -zxf ./bochs-2.7.tar.gz
cd ./bochs-2.7

############################################################
## step 2: configure
############################################################

# do not use --enable-plugins, there is a core dump

# do not use --enable-cpp, it's for old MS c++ compiler, see
# https://bochs.sourceforge.io/doc/docbook/user/compiling.html

# use --with-term and --with-x11 beacuse to use bochs
# in terminal and x windows, if you want to use other
# gui lib, see https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html#BOCHSOPT-DISPLAYLIBRARY

./configure --with-term --with-x11 --enable-debugger --enable-all-optimizations --enable-readline --enable-long-phy-address --enable-ltdl-install --enable-idle-hack --enable-a20-pin --enable-x86-64 --enable-smp --enable-cpu-level=6 --enable-large-ramfile --enable-repeat-speedups --enable-fast-function-calls --enable-handlers-chaining --enable-trace-linking --enable-configurable-msrs --enable-show-ips --enable-debugger-gui --enable-iodebug --enable-logging --enable-assert-checks --enable-fpu --enable-vmx=2 --enable-svm --enable-3dnow --enable-alignment-check --enable-monitor-mwait --enable-avx --enable-evex --enable-x86-debugger --enable-pci --enable-usb --enable-voodoo

############################################################
## step 3: make
############################################################
make -j4

############################################################
## step 4: test
############################################################
./bochs