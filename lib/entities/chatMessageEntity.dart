import 'package:flutter_application/entities/authorEntity.dart';

class ChatMessage {
  String id;
  String text;
  Author author;
  int timestamp;
  String? imageUrl;

  ChatMessage({required this.id, required this.text, required this.author, required this.timestamp, this.imageUrl});
}