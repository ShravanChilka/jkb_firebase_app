import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/chat/view/widgets/message_list_tile.dart';
import 'package:jkb_firebase_app/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreListView.separated(
      reverse: true,
      controller: context.read<ChatViewModel>().scrollController,
      padding: EdgeInsets.symmetric(horizontal: 10),
      query: context.read<ChatViewModel>().getMessages(),
      itemBuilder: (context, snapshot) {
        final message = snapshot.data();
        final isSender = context.read<ChatViewModel>().isSender(message.sentBy);
        return MessageListTile(isSender: isSender, message: message);
      },
      separatorBuilder: (context, index) => SizedBox(height: 4),
    );
  }
}
