import 'native_library_dir_platform_interface.dart';

class NativeLibraryDir {
  Future<String?> getNativeLibraryDir() {
    return NativeLibraryDirPlatform.instance.getNativeLibraryDir();
  }
}
