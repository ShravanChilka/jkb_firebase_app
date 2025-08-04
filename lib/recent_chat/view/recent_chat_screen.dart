import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:jkb_firebase_app/chat/view/chat_screen_provider.dart';
import 'package:jkb_firebase_app/recent_chat/view_model/recent_chat_view_model.dart';
import 'package:provider/provider.dart';

class RecentChatScreen extends StatelessWidget {
  const RecentChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recent chats")),
      body: FirestoreListView.separated(
        query: context.read<RecentChatViewModel>().getAllRecentChats(),
        itemBuilder: (context, snapshot) {
          final recentChat = context
              .read<RecentChatViewModel>()
              .getRecentChatStream(snapshot: snapshot);
          return StreamBuilder(
            stream: recentChat,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final recentChatModel = snapshot.requireData;
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatScreenProvider(
                          receiver: recentChatModel.receiver,
                          sender: context.read<AuthViewModel>().user!,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(recentChatModel.receiver.name),
                  subtitle: Text(recentChatModel.message.message),
                );
              }
              return SizedBox();
            },
          );
        },
        separatorBuilder: (context, index) => Divider(height: 1),
      ),
    );
  }
}
