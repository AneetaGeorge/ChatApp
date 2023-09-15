import 'package:flutter/material.dart';
import 'package:flutter_application/entities/authorEntity.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';
import 'package:flutter_application/widgets/chatBubble.dart';
import 'package:flutter_application/widgets/chatInput.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {

    String username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome $username!',
          style: const TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return ChatBubble(
                    chatMessage: ChatMessage(
                        id: '123',
                        text: 'First message',
                        imageUrl: 'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
                        author: Author(username: username),
                        timestamp: DateTime.now().millisecondsSinceEpoch
                    ),
                    alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight
                );
              }
            ),
          ),
          ChatInput()
        ],
      ),
    );
  }
}
