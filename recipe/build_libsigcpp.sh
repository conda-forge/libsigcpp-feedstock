#!/usr/bin/env bash
set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build

mkdir builddir

meson ${MESON_ARGS} --prefix="${PREFIX}" --libdir=lib builddir .

cd builddir
ninja -j${CPU_COUNT}
ninja test
ninja install
