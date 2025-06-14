
import 'package:flutter/material.dart';

class TurnByTurnOverlay extends StatelessWidget {
  final double distance;
  final double bearing;

  const TurnByTurnOverlay({Key? key, required this.distance, required this.bearing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text("Distance: \${distance.toStringAsFixed(1)} m", style: const TextStyle(color: Colors.white)),
            Text("Bearing: \${bearing.toStringAsFixed(1)}°", style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
