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
    List<ChatMessage> chatMessages = [ChatMessage(
        id: '1',
        text: 'First message',
        imageUrl: 'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
        author: Author(username: 'Aneeta'),
        timestamp: DateTime.now().millisecondsSinceEpoch
      ),
      ChatMessage(
          id: '2',
          text: 'Second message',
          author: Author(username: 'Aneeta'),
          timestamp: DateTime.now().millisecondsSinceEpoch
      ),
      ChatMessage(
          id: '3',
          text: 'Third message',
          author: Author(username: 'Jane'),
          timestamp: DateTime.now().millisecondsSinceEpoch
      ),
    ];

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
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                    chatMessage: chatMessages[index],
                    alignment: username == chatMessages[index].author.username ? Alignment.centerRight : Alignment.centerLeft
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
