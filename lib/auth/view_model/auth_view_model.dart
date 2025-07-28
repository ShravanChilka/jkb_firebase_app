import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/login_request_model.dart';
import 'package:jkb_firebase_app/auth/model/register_request_model.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/auth/service/auth_firebase_service.dart';

enum AuthScreenType { login, register }

class AuthViewModel extends ChangeNotifier {
  AuthScreenType screen = AuthScreenType.login;

  UserModel? user;

  final _service = AuthFirebaseService();

  StreamSubscription? _userSubscription;

  void load() {
    _userSubscription = _service.getUserStream().listen((event) {
      user = event;
      notifyListeners();
    });
  }

  void changeScreenEvent(AuthScreenType value) {
    screen = value;
    notifyListeners();
  }

  void register(RegisterRequestModel request) async {
    await _service.register(request);
  }

  void login(LoginRequestModel request) async {
    await _service.login(request);
  }

  void logout() async {
    await _service.logout();
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}
