import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/recent_chat/view/recent_chat_screen_provider.dart';
import 'package:jkb_firebase_app/shared/notification/notification_service.dart';

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
                MaterialPageRoute(
                  builder: (context) => RecentChatScreenProvider(),
                ),
              );
            },
            icon: Icon(Icons.message),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            NotificationService.show();
          },
          child: Text("Show notification"),
        ),
      ),
    );
  }
}
