#!/bin/bash

workdir=$(pwd)

export BXSHARE=${pwd}/bios

./bochs -f .bochsrc
