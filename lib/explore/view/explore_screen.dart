import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/recent_chat/view/recent_chat_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RecentChatScreen()),
              );
            },
            icon: Icon(Icons.message),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
