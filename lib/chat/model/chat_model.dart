class ChatModel {
  const ChatModel({
    required this.id,
    this.backgroundImageUrl,
    required this.users,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as String,
      backgroundImageUrl: map['backgroundImageUrl'] as String?,
      users: List<String>.from(map['users'] as List),
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'backgroundImageUrl': backgroundImageUrl, 'users': users};
  }

  final String id;
  final List<String> users;
  final String? backgroundImageUrl;
}
