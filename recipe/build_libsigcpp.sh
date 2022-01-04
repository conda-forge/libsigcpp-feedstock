#!/usr/bin/env bash
set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build

if [[ "$target_platform" == osx* ]]; then
  # C++17 support
  export CXXFLAGS="${CXXFLAGS} -std=c++1z"
fi

# configure, make, install, check
./configure --prefix="${PREFIX}" \
  || { cat config.log; exit 1; }
make -j${CPU_COUNT}
make check
make install
