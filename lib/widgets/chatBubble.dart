import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubble({super.key, required this.message, required this.alignment});

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
                '$message',
                style: const TextStyle(
                    fontSize: 14
                )
            ),
            Image.network(
              'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
              height: 200,)
          ],
        ),
      ),
    );
  }
}
