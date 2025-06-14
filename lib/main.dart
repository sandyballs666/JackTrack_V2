
import 'package:flutter/material.dart';

void main() {
  runApp(const JackTrackApp());
}

class JackTrackApp extends StatelessWidget {
  const JackTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JackTrack',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const PlaceholderScreen(),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JackTrack')),
      body: const Center(child: Text('JackTrack Production Build Ready')),
    );
  }
}
