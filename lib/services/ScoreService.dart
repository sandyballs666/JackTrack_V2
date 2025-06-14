
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/score_model.dart';
import 'FirebaseService.dart';

class ScoreService {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> submitScore(ScoreModel score) async {
    await _firebaseService.scores.add(score.toJson());
  }

  Stream<List<ScoreModel>> getScoresByGame(String gameId) {
    return _firebaseService.scores
        .where('gameId', isEqualTo: gameId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ScoreModel.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }
}
