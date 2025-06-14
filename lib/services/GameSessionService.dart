
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/game_model.dart';
import 'FirebaseService.dart';

class GameSessionService {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> createNewGame(GameModel game) async {
    await _firebaseService.games.doc(game.gameId).set(game.toJson());
  }

  Stream<GameModel> getGameStream(String gameId) {
    return _firebaseService.games.doc(gameId).snapshots().map((doc) =>
        GameModel.fromJson(doc.data() as Map<String, dynamic>));
  }

  Future<void> endGame(String gameId) async {
    await _firebaseService.games.doc(gameId).update({'active': false});
  }
}
