import 'package:flutter/material.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage chatMessage;
  final Alignment alignment;
  const ChatBubble({super.key, required this.chatMessage, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
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
                '${chatMessage.text}',
                style: const TextStyle(
                    fontSize: 14
                )
            ),
            if(chatMessage.imageUrl != null )
              Image.network(
                '${chatMessage.imageUrl}',
              // 'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
              height: 200,)

          ],
        ),
      ),
    );
  }
}
