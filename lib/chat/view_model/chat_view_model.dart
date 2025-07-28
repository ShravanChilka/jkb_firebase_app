import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/model/message_model.dart';
import 'package:jkb_firebase_app/chat/service/chat_firebase_service.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel({required this.receiver, required this.sender});

  final UserModel receiver;
  final UserModel sender;

  final _service = ChatFirebaseService();

  final scrollController = ScrollController();

  Query<MessageModel> getMessages() {
    return _service.getMessages(sender: sender, receiver: receiver);
  }

  void sendMessage(String message) async {
    await _service.sendMessage(
      message: message,
      sender: sender,
      receiver: receiver,
    );
  }

  bool isSender(String sentBy) {
    if (sentBy == sender.id) return true;
    return false;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
