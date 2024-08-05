import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:native_library_dir/native_library_dir.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _nativeLibraryDir = 'Unknown';
  final _nativeLibraryDirPlugin = NativeLibraryDir();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String nativeLibraryDir;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      nativeLibraryDir = await _nativeLibraryDirPlugin.getNativeLibraryDir() ??
          'Unknown Native Library Dir';
    } on PlatformException {
      nativeLibraryDir = 'Failed to getNativeLibraryDir().';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _nativeLibraryDir = nativeLibraryDir;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running path: $_nativeLibraryDir\n'),
        ),
      ),
    );
  }
}
