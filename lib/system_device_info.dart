
import 'system_device_info_platform_interface.dart';

class SystemDeviceInfo {
  /// 获取系统总容量
  Future<int?> totalSize() async {
    return SystemDeviceInfoPlatform.instance.totalSize();
  }

  /// 获取系统可用容量
  Future<int?> freeSize() async {
    return SystemDeviceInfoPlatform.instance.freeSize();
  }
}
