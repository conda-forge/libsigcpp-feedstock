@echo off
setlocal EnableDelayedExpansion

SET MAKE=gnumake.exe

bash configure --prefix="%PREFIX%"
if errorlevel 1 exit 1

gnumake
if errorlevel 1 exit 1

make check
if errorlevel 1 exit 1

make install
if errorlevel 1 exit 1