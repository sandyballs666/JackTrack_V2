
import 'package:flutter/material.dart';
import '../services/FirebaseService.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  LoginScreen({Key? key}) : super(key: key);

  void _signIn(BuildContext context) async {
    await _firebaseService.signInAnonymously();
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JackTrack Login")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Sign In Anonymously"),
          onPressed: () => _signIn(context),
        ),
      ),
    );
  }
}
