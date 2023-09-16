import 'package:flutter/material.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage chatMessage;
  final Alignment alignment;
  final Color color;
  const ChatBubble({super.key, required this.chatMessage, required this.alignment, required this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(24),
        decoration:  BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24)
            )
        ),
        child: Column(
          //Take min height
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                chatMessage.text,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white
                )
            ),
            if(chatMessage.imageUrl != null )
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: NetworkImage(chatMessage.imageUrl!))
                )
              )
          ],
        ),
      ),
    );
  }
}
