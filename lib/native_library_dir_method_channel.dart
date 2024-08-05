import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_library_dir_platform_interface.dart';

/// An implementation of [NativeLibraryDirPlatform] that uses method channels.
class MethodChannelNativeLibraryDir extends NativeLibraryDirPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_library_dir');

  @override
  Future<String?> getNativeLibraryDir() async {
    final version =
        await methodChannel.invokeMethod<String>('getNativeLibraryDir');
    return version;
  }
}
