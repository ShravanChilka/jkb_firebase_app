import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/view/chat_screen.dart';
import 'package:jkb_firebase_app/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatScreenProvider extends StatelessWidget {
  const ChatScreenProvider({
    super.key,
    required this.receiver,
    required this.sender,
  });

  final UserModel receiver;
  final UserModel sender;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(receiver: receiver, sender: sender),
      child: ChatScreen(receiver: receiver, sender: sender),
    );
  }
}
