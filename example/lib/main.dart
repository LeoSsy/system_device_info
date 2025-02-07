import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:system_device_info/system_device_info.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String? _totalSize;
  String? _freeSize;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      final totalSize = await SystemDeviceInfo.totalSize();
      final unit = ['B', 'KB', 'MB', 'GB'];
      final tp = (log(totalSize!) / log(1000)).floor();
      _totalSize = '${(totalSize / pow(1000, tp)).toStringAsFixed(2)}${unit[tp.toInt()]}';
      final freeSize = await SystemDeviceInfo.freeSize();
      final tp1 = (log(freeSize!) / log(1000)).floor();
      _freeSize = '${(freeSize / pow(1000, tp)).toStringAsFixed(2)}${unit[tp1.toInt()]}';
    } on PlatformException {
      _totalSize = '0B';
      _freeSize = '0B';
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('total Size : ${_totalSize ?? 0}\n'),
              Text('fress Size : ${_freeSize ?? 0}\n'),
            ],
          ),
        ),
      ),
    );
  }
}
