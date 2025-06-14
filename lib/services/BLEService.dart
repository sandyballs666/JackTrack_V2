
import 'dart:async';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BLEService {
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connection;
  QualifiedCharacteristic? _characteristic;

  Stream<DiscoveredDevice> startScan() {
    return _ble.scanForDevices(
      withServices: [],
      scanMode: ScanMode.lowLatency,
    );
  }

  Future<void> stopScan() async {
    await _scanSubscription?.cancel();
  }

  Stream<ConnectionStateUpdate> connectToDevice(String deviceId) {
    _connection?.cancel();
    return _ble.connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    );
  }

  Future<void> disconnectDevice(String deviceId) async {
    await _ble.disconnectDevice(id: deviceId);
  }

  Stream<List<int>> subscribeToCharacteristic(
      String deviceId, Uuid serviceUuid, Uuid charUuid) {
    _characteristic = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: charUuid,
      deviceId: deviceId,
    );
    return _ble.subscribeToCharacteristic(_characteristic!);
  }
}
