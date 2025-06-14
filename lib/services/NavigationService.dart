
import 'dart:math';
import 'package:geolocator/geolocator.dart';

class NavigationService {
  double calculateDistance(Position userPos, double targetLat, double targetLng) {
    return Geolocator.distanceBetween(
      userPos.latitude,
      userPos.longitude,
      targetLat,
      targetLng,
    );
  }

  double calculateBearing(Position userPos, double targetLat, double targetLng) {
    double lat1 = _degToRad(userPos.latitude);
    double lon1 = _degToRad(userPos.longitude);
    double lat2 = _degToRad(targetLat);
    double lon2 = _degToRad(targetLng);

    double dLon = lon2 - lon1;
    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double bearing = atan2(y, x);
    return (_radToDeg(bearing) + 360) % 360;
  }

  double _degToRad(double deg) => deg * (pi / 180);
  double _radToDeg(double rad) => rad * (180 / pi);
}
