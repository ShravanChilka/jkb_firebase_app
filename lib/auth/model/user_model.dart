import 'package:jkb_firebase_app/auth/model/register_request_model.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }

  factory UserModel.fromRegisterRequestModel(
    String id,
    RegisterRequestModel request,
  ) {
    return UserModel(
      id: id,
      name: request.name,
      username: request.username,
      email: request.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name.trim(),
      "username": username.toLowerCase().trim(),
      "email": email.trim(),
    };
  }

  final String id;
  final String name;
  final String username;
  final String email;
}
