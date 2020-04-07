#!/usr/bin/env bash
set -ex

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
