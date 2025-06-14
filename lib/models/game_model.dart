
class GameModel {
  final String gameId;
  final String courseId;
  final DateTime startTime;
  final List<String> players;
  final bool active;

  GameModel({
    required this.gameId,
    required this.courseId,
    required this.startTime,
    required this.players,
    required this.active,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      gameId: json['gameId'],
      courseId: json['courseId'],
      startTime: (json['startTime'] as Timestamp).toDate(),
      players: List<String>.from(json['players']),
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'courseId': courseId,
      'startTime': startTime,
      'players': players,
      'active': active,
    };
  }
}
