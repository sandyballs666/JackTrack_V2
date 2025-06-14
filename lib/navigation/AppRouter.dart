
import 'package:flutter/material.dart';
import '../screens/LoginScreen.dart';
import '../screens/HomeScreen.dart';
import '../screens/MapScreen.dart';
import '../screens/PairDeviceScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/map':
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case '/pair':
        return MaterialPageRoute(builder: (_) => const PairDeviceScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for \${settings.name}')),
          ),
        );
    }
  }
}
