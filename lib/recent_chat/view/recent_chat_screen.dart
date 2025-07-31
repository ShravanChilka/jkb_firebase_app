import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:jkb_firebase_app/chat/view/chat_screen_provider.dart';
import 'package:jkb_firebase_app/recent_chat/service/recent_chat_firebase_service.dart';
import 'package:provider/provider.dart';

class RecentChatScreen extends StatelessWidget {
  RecentChatScreen({super.key});

  final service = RecentChatFirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recent chats")),
      body: StreamBuilder(
        stream: service.getAllRecentChats(
          context.read<AuthViewModel>().user!.id,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final recentChats = snapshot.requireData;
            return ListView.separated(
              itemCount: recentChats.length,
              itemBuilder: (context, index) {
                final recentChat = recentChats[index];
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
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
