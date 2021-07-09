#!/usr/bin/env bash
set -ex

mkdir builddir
meson --prefix="${PREFIX}" --libdir=lib builddir .
cd builddir
ninja -j${CPU_COUNT}
ninja test
ninja install
#
