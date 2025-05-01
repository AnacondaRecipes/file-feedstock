xcopy /s %RECIPE_DIR%\win_build\* .
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

mkdir build
cd build
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%PREFIX%/Library ..
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%
cmake --build .
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%
cmake --install .
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

:: All just import libs under different names for backwards compatibility.
copy %LIBRARY_LIB%\libmagic.lib %LIBRARY_LIB%\libmagic.dll.a
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%
