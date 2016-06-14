#!/bin/sh
git submodule init
git submodule update --init
git submodule foreach git pull origin master
