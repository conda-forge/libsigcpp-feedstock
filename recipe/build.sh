#!/usr/bin/env bash
set -ex

# set and verify flags
if [ "$(uname)" == "Darwin" ]; then
  # for Mac OSX
  # It seems like this is/should be done by toolchain...
  export MACOSX_VERSION_MIN="10.9"
  export CXXFLAGS="${CXXFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
  export LDFLAGS="${LDFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
  export LINKFLAGS="${LDFLAGS}"
fi

# configure, make, install, check
./configure --prefix="${PREFIX}" \
  || { cat config.log; exit 1; }
make
make check
make install

# Remove libtool files
find $PREFIX -name '*.la' -delete
