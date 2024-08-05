import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_library_dir_method_channel.dart';

abstract class NativeLibraryDirPlatform extends PlatformInterface {
  /// Constructs a NativeLibraryDirPlatform.
  NativeLibraryDirPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeLibraryDirPlatform _instance = MethodChannelNativeLibraryDir();

  /// The default instance of [NativeLibraryDirPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeLibraryDir].
  static NativeLibraryDirPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeLibraryDirPlatform] when
  /// they register themselves.
  static set instance(NativeLibraryDirPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getNativeLibraryDir() {
    throw UnimplementedError('getNativeLibraryDir() has not been implemented.');
  }
}
