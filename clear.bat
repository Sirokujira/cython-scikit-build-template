set PACKAGENAME=template
set SOURCENAME=temp
del %SOURCENAME%\*.pyd
del cythonize.json
rd /s /q build
rd /s /q _skbuild
rd /s /q _cmake_test_compile
rd /s /q dist
rd /s /q del %SOURCENAME%\__pycache__
rd /s /q %PACKAGENAME%.egg-info
rd /s /q .eggs
pip uninstall %PACKAGENAME% -y