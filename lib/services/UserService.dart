
import '../models/user_model.dart';
import 'FirebaseService.dart';

class UserService {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> createUser(UserModel user) async {
    await _firebaseService.users.doc(user.userId).set(user.toJson());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await _firebaseService.users.doc(userId).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
