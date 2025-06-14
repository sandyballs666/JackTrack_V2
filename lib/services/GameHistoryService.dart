
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/game_model.dart';
import 'FirebaseService.dart';

class GameHistoryService {
  final FirebaseService _firebaseService = FirebaseService();

  Stream<List<GameModel>> getPastGames(String userId) {
    return _firebaseService.games
        .where('players', arrayContains: userId)
        .orderBy('startTime', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => GameModel.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }
}
