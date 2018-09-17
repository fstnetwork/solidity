#!/usr/bin/env bash
cd $(dirname "$0")/.. &&

touch prerelease.txt

mkdir -p build &&
cd build &&
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS='-march=native -O3 -pipe' -DCMAKE_CXX_FLAGS='-march=native -O3 -pipe' &&
make -j16

if [ $? -ne 0 ]; then
	echo "Failed to build"
	exit 1
fi
