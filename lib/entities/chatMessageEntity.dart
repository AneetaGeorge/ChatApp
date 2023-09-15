import 'package:flutter_application/entities/authorEntity.dart';

class ChatMessage {
  String id;
  String text;
  Author author;
  int timestamp;
  String? imageUrl;

  ChatMessage({required this.id, required this.text, required this.author, required this.timestamp, this.imageUrl});

  factory ChatMessage.fromJson(Map<String,dynamic> json) {
    return ChatMessage(id: json['id'], text: json['text'], imageUrl: json['imageUrl'], author: Author.fromJson(json), timestamp: json['createdAt']);
  }
}