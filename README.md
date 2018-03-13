luawinmake
==========

[![Build status](https://ci.appveyor.com/api/projects/status/github/tieske/luawinmake?branch=master&svg=true)](https://ci.appveyor.com/project/tieske/luawinmake)

Windows batch file to build Lua from source. Simply place the `.\etc\winmake.bat` file 
in your downloaded and unpacked Lua source folder (preferably in a `\etc\` subfolder). And run it from the
root folder to build Lua (eg.  `etc\winmake /help`).

Since there also is a [Github repo with Lua sources](https://github.com/lua/lua) you can now also use `winmake` to build from those sources (file structure with `.\etc\` and `.\src\` is no longer required).

Make sure that your compiler is in your system path before running it. For the Microsoft toolchains
you can use their commandshell. The TDM release also has a shell available for 32 and 64 bit.

NOTE: if you're interested in a more complete Lua setup, checkout [luawinmulti](https://github.com/Tieske/luawinmulti), which builds on top of luawinmake.

Downloads
=========

If all you need is a quick Windows binary, then checkout the [CI build artifacts](https://ci.appveyor.com/project/tieske/luawinmake).
Select the version you need and download the archive from the artifacts.

Commands
========

- `etc\winmake /help` displays usage info
- `etc\winmake` builds the Lua installation
- `etc\winmake <toolchain>` builds using the specified toolchain, skips auto detection
- `etc\winmake clean` cleans the (intermediate) build results
- `etc\winmake local` installs the build Lua version in `.\local\`
- `etc\winmake localv` installs the build Lua version in `.\local\` in a versioned manner
- `etc\winmake install <path>` installs the build Lua version in `<path>`
- `etc\winmake install <path>` installs the build Lua version in `<path>` in a versioned manner

Available flags;
- `--nocompat` When building, this will disable all compatibilty flags (otherwise default flags same as the MinGW make file will be used)

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

The `localv` and `installv` commands create versioned installations, with the following differences;
````
{root}
  +-- bin                      --> eg. contains lua52.exe and luac52.exe
  +-- include
  |    +-- lua
  |         +-- <LuaVersion>   --> containing the header files
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
- 5.4

Lua is build with the default compatibility options (mimics the unix makefiles for each 
of the Lua versions listed above). Unless the `--nocompat` flag is used.

It supports MS and GCC based compilers (autodetects; uses the first one found in the system path), and was tested with;

- Win7 SDK
- Visual Studio 2008, 2010, 2012, 2013 and 2015
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
