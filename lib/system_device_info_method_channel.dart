import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'system_device_info_platform_interface.dart';

/// An implementation of [SystemDeviceInfoPlatform] that uses method channels.
class MethodChannelSystemDeviceInfo extends SystemDeviceInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('system_device_info');

  /// 获取系统总容量
  @override
  Future<int?> totalSize() async {
    return await methodChannel.invokeMethod('getTotalSize');
  }

  /// 获取系统可用容量
  @override
  Future<int?> freeSize() async {
    return await methodChannel.invokeMethod('getFreeSize');
  }
}
