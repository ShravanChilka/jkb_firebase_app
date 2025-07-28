import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/chat/model/message_model.dart';

class MessageListTile extends StatelessWidget {
  const MessageListTile({
    super.key,
    required this.isSender,
    required this.message,
  });

  final bool isSender;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Ink(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: isSender
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message.message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
