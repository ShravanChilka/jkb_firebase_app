import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';

class SearchFirebaseService {
  final _client = FirebaseFirestore.instance;

  Query<UserModel> searchUser(String query) {
    return _client
        .collection("users")
        .where("username", isGreaterThanOrEqualTo: query)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return UserModel.fromMap(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toMap();
          },
        );
  }
}
