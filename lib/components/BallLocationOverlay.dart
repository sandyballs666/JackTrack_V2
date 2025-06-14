
import 'package:flutter/material.dart';

class BallLocationOverlay extends StatelessWidget {
  final double distance;

  const BallLocationOverlay({Key? key, required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Ball Distance: \${distance.toStringAsFixed(2)} m",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
