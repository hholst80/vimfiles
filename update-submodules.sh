#!/bin/sh
git submodule init
git submodule update --init --recursive
git submodule foreach git pull origin master
