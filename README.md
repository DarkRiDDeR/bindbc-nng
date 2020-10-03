[![Dub](https://img.shields.io/dub/v/bindbc-nng.svg?style=flat)](https://code.dlang.org/packages/bindbc-nng)
[![License](https://img.shields.io/github/license/DarkRiDDeR/bindbc-nng.svg?style=flat)](https://github.com/DarkRiDDeR/bindbc-nng/blob/master/LICENSE)

# bindbc-nng

Dynamic and static bindings to [NNG (nanomsg-next-gen)](https://github.com/nanomsg/nng), compatible with -betterC, @nogc, and nothrow.

## Usage
By default, `bindbc-nng` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the NNG library, so the NNG shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the NNG library---either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use NNG, add `bindbc-nng` as a dependency to your project's package config file. For example, the following is configured to NNG as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-nng": "~>0.0.1",
}
```

__dub.sdl__
```
dependency "bindbc-nng" version="~>0.0.1"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the NNG shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the NNG DLL with your program. On other systems, it usually means the user must install the NNG runtime library through a package manager.

To load the shared library, you need to call the `loadNNG` function. This returns a member of the `NngSupport` enumeration (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `NngSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `NngSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `NngSupport` indicating a version number that matches the version of NNG that `bindbc-nng` was configured at compile-time to load.
```d
import bindbc.nng;

/*
This version attempts to load the NNG shared library using well-known variations
of the library name for the host system.
*/
NngSupport ret = loadNNG();

// Handle error. For most use cases, its reasonable to use the the error handling API in
// bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
// possible to determine the root cause via the return value:

if(ret == NngSupport.noLibrary) {
// NNG shared library failed to load
}
else if(NngSupport.badLibrary) {
// One or more symbols failed to load. The likely cause is that the
// shared library is for a lower version than bindbc-nng was configured
// to load.

/*
This version attempts to load the NNG library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `nng.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadNNG("libs/nng.dll")
```

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedNNGVersion`. It returns one of the following:

* `NngSupport.noLibrary` if `loadNNG` returned `NngSupport.noLibrary`
* `NngSupport.badLibrary` if `loadNNG` returned `NngSupport.badLibrary` and no version of NNG successfully loaded
* a member of `NngSupport` indicating the version of NNG that successfully loaded. When `loadNNG` returns `NngSupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `fiSupport`.

The function `isNNGLoaded` returns `true` if any version of NNG was successfully loaded and `false` otherwise.

## The static binding
The static binding has a link-time dependency on either the shared or the static NNG library. On Windows, you can link with the static library or, to use the shared library (`nng.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the NNG development package be installed on your system at compile time, either by compiling the NNG source yourself, downloading the NNG precompiled binaries for Windows, or installing via a system package manager.

When linking with the static library, there is no runtime dependency on NNG. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually---loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindNNG_Static` version to the compiler and link with the appropriate library.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindNNG_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-nng` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-nng": "~>0.0.1"
},
"versions": ["BindNNG_Static"],
"libs": ["nng"]
```

__dub.sdl__
```
dependency "bindbc-nng" version="~>0.0.1"
versions "BindNNG_Static"
libs "nng"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-nng` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-nng": "~>0.0.1"
},
"subConfigurations": {
    "bindbc-nng": "static"
},
"libs": ["nng"]
```

__dub.sdl__
```
dependency "bindbc-nng" version="~>0.0.1"
subConfiguration "bindbc-nng" "static"
libs "nng"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support

`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-nng": "~>0.0.1"
},
"subConfigurations": {
    "bindbc-nng": "staticBC"
},
"libs": ["nng"]
```

__dub.sdl__
```
dependency "bindbc-nng" version="~>0.0.1"
subConfiguration "bindbc-nng" "staticBC"
libs "nng"
```
When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.


## License

Boost
