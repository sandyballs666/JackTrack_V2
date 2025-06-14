
import 'package:flutter_test/flutter_test.dart';
import '../lib/models/user_model.dart';

void main() {
  group("UserModel Test", () {
    test("Serialization Test", () {
      final user = UserModel(
        userId: "test123",
        email: "test@example.com",
        displayName: "Test User",
        joinedDate: DateTime.now(),
      );

      final json = user.toJson();
      final newUser = UserModel.fromJson(json);

      expect(user.userId, newUser.userId);
      expect(user.email, newUser.email);
    });
  });
}
