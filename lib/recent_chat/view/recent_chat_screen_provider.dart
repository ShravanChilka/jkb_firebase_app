import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:jkb_firebase_app/recent_chat/view/recent_chat_screen.dart';
import 'package:jkb_firebase_app/recent_chat/view_model/recent_chat_view_model.dart';
import 'package:provider/provider.dart';

class RecentChatScreenProvider extends StatelessWidget {
  const RecentChatScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          RecentChatViewModel(sender: context.read<AuthViewModel>().user!),
      child: RecentChatScreen(),
    );
  }
}
