luawinmake
==========

Windows batch file to build Lua from source. Simply place the `./etc/winmake.bat` file 
in your downloaded and unpacked Lua source folder (in a `/etc/` subfolder). And run it from the
root folder to build Lua.

Make sure that your compiler is in your system path before running it. For the Microsoft toolchains
you can use their commandshell. The TDM release also has a shell available for 32 and 64 bit.

Commands
========

- `etc\winmake /help` displays usage info
- `etc\winmake` builds the Lua installation
- `etc\winmake <toolchain>` builds using the specified toolchain, skips auto detection
- `etc\winmake clean` cleans the (intermediate) build results
- `etc\winmake local` installs the build Lua version in `.\local\`
- `etc\winmake install <path>` installs the build Lua version in `<path>`

File structure
==============

Installing creates a structure similar to the standard Lua MinGW install;
````
{root}
  +-- bin
  +-- include
  +-- lib
  |    +-- lua
  |         +-- <LuaVersion>
  +-- man
  |    +-- man1
  +-- share
       +-- lua
            +-- <LuaVersion>
````

Compatibility
=============

It auto detects the Lua version from the source code. It was tested with;

- 5.1
- 5.2
- 5.3

Lua is build with the default compatibility options (mimics the unix makefiles for each of the Lua versions listed above).

It supports MS and GCC based compilers (autodetects; uses the first one found in the system path), and was tested with;

- Win7 SDK
- Visual Studio 2008, 2010, 2012 and 2013
- MinGW
- TDM32
- TDM64

Thanks to
=========
- The Lua team for a great language
- @ignacio for testing various Visual Studio builds

License
=======
[MIT](http://opensource.org/licenses/MIT)
