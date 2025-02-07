import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'system_device_info_method_channel.dart';

abstract class SystemDeviceInfoPlatform extends PlatformInterface {
  /// Constructs a SystemDeviceInfoPlatform.
  SystemDeviceInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static SystemDeviceInfoPlatform _instance = MethodChannelSystemDeviceInfo();

  /// The default instance of [SystemDeviceInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelSystemDeviceInfo].
  static SystemDeviceInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemDeviceInfoPlatform] when
  /// they register themselves.
  static set instance(SystemDeviceInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 获取系统总容量
  Future<int?>totalSize(){
    throw UnimplementedError('totalSize() has not been implemented.');
  }

  /// 获取系统可用容量
  Future<int?>freeSize(){
    throw UnimplementedError('freeSize() has not been implemented.');
  }
}
