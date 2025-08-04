import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/model/chat_model.dart';
import 'package:jkb_firebase_app/recent_chat/model/recent_chat_model.dart';
import 'package:jkb_firebase_app/recent_chat/service/recent_chat_firebase_service.dart';

class RecentChatViewModel extends ChangeNotifier {
  RecentChatViewModel({required this.sender});

  final UserModel sender;

  final _service = RecentChatFirebaseService();

  Query<ChatModel> getAllRecentChats() {
    return _service.getAllRecentChats(sender.id);
  }

  Stream<RecentChatModel> getRecentChatStream({
    required QueryDocumentSnapshot<ChatModel> snapshot,
  }) {
    return _service.getRecentChatStream(
      snapshot: snapshot,
      senderUserId: sender.id,
    );
  }
}
