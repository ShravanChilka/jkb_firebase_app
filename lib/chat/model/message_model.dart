class MessageModel {
  const MessageModel({
    required this.id,
    required this.message,
    required this.sentAt,
    required this.sentBy,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      message: map['message'] as String,
      sentAt: DateTime.fromMillisecondsSinceEpoch(map['sentAt'] as int),
      sentBy: map['sentBy'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "message": message,
      "sentAt": sentAt.millisecondsSinceEpoch,
      "sentBy": sentBy,
    };
  }

  final String id;
  final String message;
  final DateTime sentAt;
  final String sentBy;
}
