
class ScoreModel {
  final String gameId;
  final String userId;
  final int hole;
  final int strokes;

  ScoreModel({
    required this.gameId,
    required this.userId,
    required this.hole,
    required this.strokes,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      gameId: json['gameId'],
      userId: json['userId'],
      hole: json['hole'],
      strokes: json['strokes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'userId': userId,
      'hole': hole,
      'strokes': strokes,
    };
  }
}
