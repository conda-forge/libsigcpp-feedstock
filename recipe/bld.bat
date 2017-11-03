@echo off
setlocal EnableDelayedExpansion

bash configure --prefix="%PREFIX%"
if errorlevel 1 exit 1

make
if errorlevel 1 exit 1

make check
if errorlevel 1 exit 1

make install
if errorlevel 1 exit 1