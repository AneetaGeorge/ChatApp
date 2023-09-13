import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/chatBubble.dart';
import 'package:flutter_application/widgets/chatInput.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Aneeta!',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout)
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
                    message: 'First message',
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
