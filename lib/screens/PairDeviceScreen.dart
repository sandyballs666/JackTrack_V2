
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../services/BLEService.dart';

class PairDeviceScreen extends StatefulWidget {
  const PairDeviceScreen({Key? key}) : super(key: key);

  @override
  State<PairDeviceScreen> createState() => _PairDeviceScreenState();
}

class _PairDeviceScreenState extends State<PairDeviceScreen> {
  final BLEService _bleService = BLEService();
  late Stream<DiscoveredDevice> _scanStream;
  final List<DiscoveredDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    _scanStream = _bleService.startScan();
    _scanStream.listen((device) {
      if (!_devices.any((d) => d.id == device.id)) {
        setState(() {
          _devices.add(device);
        });
      }
    });
  }

  void _connect(DiscoveredDevice device) {
    _bleService.connectToDevice(device.id).listen((state) {
      if (state.connectionState == DeviceConnectionState.connected) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Connected to device!")));
        Navigator.pop(context, device);
      }
    });
  }

  @override
  void dispose() {
    _bleService.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pair Golf Ball")),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          final device = _devices[index];
          return ListTile(
            title: Text(device.name.isEmpty ? "Unknown" : device.name),
            subtitle: Text(device.id),
            onTap: () => _connect(device),
          );
        },
      ),
    );
  }
}
