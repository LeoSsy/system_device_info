import Flutter
import UIKit

public class SystemDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_device_info", binaryMessenger: registrar.messenger())
    let instance = SystemDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getTotalSize":
      getTotalSize(result:result)
    case "getFreeSize":
      getFreeSize(result:result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

   private func getTotalSize(result:FlutterResult){
      do {
          let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
          let totalSize =  (attributes[.systemSize] as? NSNumber)?.int64Value
          result(totalSize)
      }catch {
          result(nil)
      }
    }
    
    
    private func getFreeSize(result:FlutterResult){
      do {
          let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
          let freeSize =  (attributes[.systemFreeSize] as? NSNumber)?.int64Value
          result(freeSize)
      }catch {
          result(nil)
      }
    }
}
