# native_library_dir (Android)

native_library_dir is a plugin for Flutter, it does only one thing, returns the path to native library directory on android devices. For some reason "Application Library" is not realized in path_provider, so here is the solution.

## How to

- Add plugin to your project
- Run method NativeLibraryDir().getNativeLibraryDir()
- Get result like "/data/app/~~rw-VZO3GDL8nJDhBDDv-lA==/com.package_ffi-cVjDjmCdh45K5aY_cnkHwQ==/lib/arm64"
