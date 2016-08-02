#!/usr/bin/env bash
set -e

# set and verify flags
#export LDFLAGS=
#export CFLAGS="-O3"
#export CXXFLAGS="-O3"
#export LIBRARY_PATH="${PREFIX}/lib"
#export INCLUDE_PATH="${PREFIX}/include"
#if [ "$(uname)" == "Darwin" ]; then
  # for Mac OSX
#  export CC=clang
#  export CXX=clang++
#  export MACOSX_VERSION_MIN="10.7"
#  export CXXFLAGS="${CXXFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
#  export CXXFLAGS="${CXXFLAGS} -stdlib=libc++"
#  export LDFLAGS="${LDFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
#  export LDFLAGS="${LDFLAGS} -stdlib=libc++"
#  export LINKFLAGS="${LDFLAGS}"
#fi
#export PKG_CONFIG_PATH=

# configure, make, install, check
./configure --prefix="${PREFIX}" \
            --enable-static \
            --disable-rpath \
  || { cat config.log; exit 1; }
make
make check
make install
