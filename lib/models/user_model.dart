
class UserModel {
  final String userId;
  final String email;
  final String displayName;
  final DateTime joinedDate;

  UserModel({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.joinedDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      email: json['email'],
      displayName: json['displayName'],
      joinedDate: (json['joinedDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'displayName': displayName,
      'joinedDate': joinedDate,
    };
  }
}
