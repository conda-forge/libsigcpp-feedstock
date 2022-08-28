setlocal EnableExtensions EnableDelayedExpansion
 @echo on

 :: meson options
 :: (set pkg_config_path so deps in host env can be found)
 set ^"MESON_OPTIONS=^
   --prefix="%LIBRARY_PREFIX%" ^
   --wrap-mode=nofallback ^
   --buildtype=release ^
   --backend=ninja ^
  ^"

 :: configure build using meson
 meson setup builddir !MESON_OPTIONS!
 if errorlevel 1 exit 1

 :: print results of build configuration
 meson configure builddir
 if errorlevel 1 exit 1

 ninja -v -C builddir -j %CPU_COUNT%
 if errorlevel 1 exit 1

 ninja -C builddir install -j %CPU_COUNT%
 if errorlevel 1 exit 1
