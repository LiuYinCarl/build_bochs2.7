#!/bin/bash

workdir=$(pwd)

export BXSHARE=${workdir}/bios

./bochs -f ./my_bochsrc
