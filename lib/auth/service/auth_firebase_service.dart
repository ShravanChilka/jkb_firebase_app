import 'package:firebase_auth/firebase_auth.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/auth/model/login_request_model.dart';
import 'package:jkb_firebase_app/auth/model/register_request_model.dart';
import 'package:jkb_firebase_app/auth/service/user_firebase_service.dart';

class AuthFirebaseService {
  final _client = FirebaseAuth.instance;
  final _service = UserFirebaseService();

  Stream<UserModel?> getUserStream() {
    return _client.authStateChanges().asyncMap((user) async {
      final id = user?.uid;
      if (id == null) return null;
      final userModel = await _service.get(id);
      return userModel;
    });
  }

  Future<UserModel?> register(RegisterRequestModel request) async {
    final userCredential = await _client.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    final id = userCredential.user?.uid;
    if (id == null) return null;

    final model = UserModel.fromRegisterRequestModel(id, request);
    final user = await _service.create(model);
    print('register success!');
    return user;
  }

  Future<UserModel?> login(LoginRequestModel request) async {
    final userCredential = await _client.signInWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    final id = userCredential.user?.uid;
    if (id == null) return null;
    final user = _service.get(id);
    print('login success!');
    return user;
  }

  Future<void> logout() async {
    await _client.signOut();
  }
}
