@echo off
setlocal EnableDelayedExpansion

SET UNIX_PREFIX=%CYGWIN_PREFIX:~9%
echo UNIX_PREFIX is %UNIX_PREFIX%

bash configure --prefix %UNIX_PREFIX% --enable-static --enable-shared --disable-documentation
if errorlevel 1 exit 1

make
if errorlevel 1 exit 1

make check
if errorlevel 1 exit 1

make install
if errorlevel 1 exit 1
