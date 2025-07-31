import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/chat/model/chat_model.dart';
import 'package:jkb_firebase_app/chat/model/message_model.dart';

class ChatFirebaseService {
  final _client = FirebaseFirestore.instance;

  Query<MessageModel> getMessages({
    required UserModel sender,
    required UserModel receiver,
  }) {
    final list = [sender.id, receiver.id]..sort();
    final chatId = list.join("_");

    return _client
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("sentAt", descending: true)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return MessageModel.fromMap(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toMap();
          },
        );
  }

  Future<void> sendMessage({
    required String message,
    required UserModel sender,
    required UserModel receiver,
  }) async {
    final list = [sender.id, receiver.id]..sort();
    final chatId = list.join("_");

    final ref = _client.collection("chats").doc(chatId).collection("messages");
    final docRef = ref.doc();

    await createChat(chatId: chatId, sender: sender, receiver: receiver);

    final model = MessageModel(
      id: docRef.id,
      message: message,
      sentAt: DateTime.now(),
      sentBy: sender.id,
    );
    await ref.add(model.toMap());
  }

  Future<void> createChat({
    required String chatId,
    required UserModel sender,
    required UserModel receiver,
  }) async {
    final ref = _client.collection("chats").doc(chatId);
    final response = await ref.get();
    if (response.exists) return;
    final model = ChatModel(
      id: chatId,
      users: [sender.id, receiver.id]..sort(),
    );
    await ref.set(model.toMap());
  }
}
