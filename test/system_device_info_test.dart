import 'package:flutter_test/flutter_test.dart';
import 'package:system_device_info/system_device_info.dart';
import 'package:system_device_info/system_device_info_platform_interface.dart';
import 'package:system_device_info/system_device_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSystemDeviceInfoPlatform
    with MockPlatformInterfaceMixin
    implements SystemDeviceInfoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<int?> freeSize() {
    // TODO: implement freeSize
    throw UnimplementedError();
  }
  
  @override
  Future<int?> totalSize() {
    // TODO: implement totalSize
    throw UnimplementedError();
  }
}

void main() {
  final SystemDeviceInfoPlatform initialPlatform = SystemDeviceInfoPlatform.instance;

  test('$MethodChannelSystemDeviceInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSystemDeviceInfo>());
  });

  test('getPlatformVersion', () async {
    SystemDeviceInfo systemDeviceInfoPlugin = SystemDeviceInfo();
    MockSystemDeviceInfoPlatform fakePlatform = MockSystemDeviceInfoPlatform();
    SystemDeviceInfoPlatform.instance = fakePlatform;

    // expect(await systemDeviceInfoPlugin.getPlatformVersion(), '42');
  });
}
