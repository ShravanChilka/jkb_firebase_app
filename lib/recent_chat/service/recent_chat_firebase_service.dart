import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/model/chat_model.dart';
import 'package:jkb_firebase_app/chat/model/message_model.dart';
import 'package:jkb_firebase_app/recent_chat/model/recent_chat_model.dart';
import 'package:rxdart/rxdart.dart';

class RecentChatFirebaseService {
  final _client = FirebaseFirestore.instance;

  Stream<List<Stream<RecentChatModel>>> getAllRecentChats(String senderUserId) {
    final chats = _client
        .collection("chats")
        .where("users", arrayContains: senderUserId)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return ChatModel.fromMap(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toMap();
          },
        );

    final response = chats.snapshots().asyncMap((event) {
      final chats = event.docs;
      return chats.map((chat) {
        final data = chat.data();
        final chatId = data.id;
        final users = chatId.split("_");
        users.remove(senderUserId);
        final receiverId = users.first;
        final receiverStream = _getUser(receiverId);
        final recentMessage = _getRecentMessage(chat);
        final response = Rx.combineLatest2(receiverStream, recentMessage, (
          receiver,
          message,
        ) {
          return RecentChatModel(receiver: receiver, message: message);
        });
        return response;
      }).toList();
    });
    return response;
  }

  Stream<MessageModel> _getRecentMessage(
    QueryDocumentSnapshot<ChatModel> chat,
  ) {
    return chat.reference
        .collection("messages")
        .limit(1)
        .orderBy("sentAt", descending: true)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return MessageModel.fromMap(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toMap();
          },
        )
        .snapshots()
        .map((event) {
          return event.docs.first.data();
        });
  }

  Stream<UserModel> _getUser(String userId) {
    return _client
        .collection("users")
        .doc(userId)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return UserModel.fromMap(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toMap();
          },
        )
        .snapshots()
        .map((event) => event.data()!);
  }
}
