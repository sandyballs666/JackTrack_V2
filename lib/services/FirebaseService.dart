
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Auth

  Future<User?> signInAnonymously() async {
    UserCredential credential = await _auth.signInAnonymously();
    return credential.user;
  }

  Future<User?> get currentUser async {
    return _auth.currentUser;
  }

  // Firestore references

  CollectionReference get users => _firestore.collection('users');
  CollectionReference get games => _firestore.collection('games');
  CollectionReference get scores => _firestore.collection('scores');
  CollectionReference get trackedBalls => _firestore.collection('trackedBalls');
}
