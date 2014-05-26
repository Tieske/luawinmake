luawinmake
==========

Windows batch file to build Lua from source. Simply place the `./etc/winmake.bat` file 
in your downloaded and unpacked Lua source folder (in a `/etc/` subfolder). And run it from the
root folder to build Lua.

Make sure that your compiler is in your system path before running it. For the Microsoft toolchains
you can use their commandshell. TDM also has a shell available.

Commands
========

- `etc\winmake /help` displays usage info
- `etc\winmake clean` cleans the (intermediate) build results
- `etc\winmake local` installs the build Lua version in `.\local\`
- `etc\winmake <path>` installs the build Lua version in `<path>`

Compatibility
=============

It auto detects the Lua version from the source code. It was tested with;

- 5.1.5
- 5.2.1
- 5.3-work2

It supports MS and GCC based compilers (autodetects; uses the first one found in the system path), and was tested with;

 - Win7 SDK
 - Visual Studio 2010
 - MinGW
 - TDM32
 - TDM64

License
=======
[MIT](http://opensource.org/licenses/MIT)
