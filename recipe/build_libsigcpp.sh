#!/usr/bin/env bash
set -ex

meson ${MESON_ARGS} --prefix="${PREFIX}" -Dlibdir=lib builddir .

ninja -C builddir -j${CPU_COUNT}
ninja -C builddir test
ninja -C builddir install
