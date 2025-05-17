# native_library_dir (Android)

native_library_dir is a plugin for Flutter, it does only one thing, returns the string path to native library directory on android devices. It may be used to run libs directly. For some reason "Application Library" is not realized in path_provider, so here is the solution.

![now you can!](https://github.com/xizerlix/native_library_dir/blob/master/img/now%20u%20can.png?raw=true)

## How to

- Add plugin to your project
- Place your compiled libs to android/app/src/main/jniLibs/[ARCH]/libyourlib.so (arm64-v8a, armeabi-v7a, etc) of your project. Your libs should be named like libyourlib.so. Without "lib" prefix you'll get error in release.
![folder](https://github.com/xizerlix/native_library_dir/blob/master/img/libs.png?raw=true)
- Add this to your AndroidManifest.xml (android/app/src/main/AndroidManifest.xml)
```xml
    <application
...
        android:extractNativeLibs="true">
...
    </application>
```
- Run method NativeLibraryDir().getNativeLibraryDir() to get string path to libs directory.
```dart
String adb = '${await NativeLibraryDir().getNativeLibraryDir()}/libadb.so';
```
- Now call your lib directly.
```dart
await Process.run(
        adb,
        ['-s', deviceName, 'shell', 'dumpsys', 'account']);
```

### Why?

I used this in my project to call compiled .so libs directly.

