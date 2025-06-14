
class TrackedBallModel {
  final String ballId;
  final String gameId;
  final String userId;
  final String bleDeviceId;
  final double latitude;
  final double longitude;

  TrackedBallModel({
    required this.ballId,
    required this.gameId,
    required this.userId,
    required this.bleDeviceId,
    required this.latitude,
    required this.longitude,
  });

  factory TrackedBallModel.fromJson(Map<String, dynamic> json) {
    return TrackedBallModel(
      ballId: json['ballId'],
      gameId: json['gameId'],
      userId: json['userId'],
      bleDeviceId: json['bleDeviceId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ballId': ballId,
      'gameId': gameId,
      'userId': userId,
      'bleDeviceId': bleDeviceId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
