
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseService {
  final CollectionReference _courses = FirebaseFirestore.instance.collection('courses');

  Future<Map<String, dynamic>?> getCourse(String courseId) async {
    final doc = await _courses.doc(courseId).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    }
    return null;
  }

  Stream<List<Map<String, dynamic>>> getAllCourses() {
    return _courses.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }
}
