
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> requestAllPermissions() async {
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
      Permission.notification,
    ].request();
  }

  Future<bool> checkAllPermissions() async {
    return await Permission.location.isGranted &&
           await Permission.bluetooth.isGranted &&
           await Permission.bluetoothScan.isGranted &&
           await Permission.bluetoothConnect.isGranted;
  }
}
