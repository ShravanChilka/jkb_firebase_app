import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/view/widgets/message_list_view.dart';
import 'package:jkb_firebase_app/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.receiver, required this.sender});

  final UserModel receiver;
  final UserModel sender;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.receiver.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  widget.receiver.username,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: MessageListView()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTapOutside: (event) {
                        // FocusScope.of(context).requestFocus(FocusNode());
                      },
                      controller: messageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your message",
                      ),
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {
                      context.read<ChatViewModel>().sendMessage(
                        messageController.text,
                      );
                      messageController.clear();
                      final controller = context
                          .read<ChatViewModel>()
                          .scrollController;
                      controller.jumpTo(controller.position.minScrollExtent);
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
