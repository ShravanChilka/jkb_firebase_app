import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/model/message_model.dart';

class RecentChatModel {
  const RecentChatModel({required this.receiver, required this.message});

  final UserModel receiver;
  final MessageModel message;
}
