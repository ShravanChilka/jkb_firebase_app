import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/search/service/search_firebase_service.dart';

class SearchViewModel extends ChangeNotifier {
  String get query => _query;
  String _query = '';

  final _service = SearchFirebaseService();

  void onQueryChangedEvent(String value) {
    if (_query == value) return;
    _query = value;
    notifyListeners();
  }

  Query<UserModel> searchUser() {
    return _service.searchUser(_query.toLowerCase().trim());
  }
}
