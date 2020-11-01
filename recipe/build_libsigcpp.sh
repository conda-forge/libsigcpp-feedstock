#!/usr/bin/env bash
set -ex

# configure, make, install, check
./configure --prefix="${PREFIX}" \
  || { cat config.log; exit 1; }
make -j${CPU_COUNT}
make check
make install
