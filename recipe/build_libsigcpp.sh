#!/usr/bin/env bash
set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build

mkdir builddir

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
    meson ${MESON_ARGS} builddir .
else
    meson --prefix="${PREFIX}" --libdir=lib builddir .
fi

cd builddir
ninja -j${CPU_COUNT}
ninja test
ninja install
#
