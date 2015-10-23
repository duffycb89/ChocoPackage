@echo off
:: Create a cmd command to run our commands for packing the choco package.


:: Clean up and create directories
:: 2 Directories expected, 1 for install 1 for files.
mkdir tools
mkdir content

::Move the install script into the tools folder.
move chocolateyInstall.ps1 tools\

:: Make package
cpack simple_choco.nuspec
