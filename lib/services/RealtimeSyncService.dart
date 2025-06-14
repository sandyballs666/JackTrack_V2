
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tracked_ball_model.dart';
import 'FirebaseService.dart';

class RealtimeSyncService {
  final FirebaseService _firebaseService = FirebaseService();

  Stream<List<TrackedBallModel>> subscribeToBalls(String gameId) {
    return _firebaseService.trackedBalls
        .where('gameId', isEqualTo: gameId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TrackedBallModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<void> updateBallLocation(TrackedBallModel ball) async {
    await _firebaseService.trackedBalls.doc(ball.ballId).set(ball.toJson());
  }
}
