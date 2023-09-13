import 'package:flutter/material.dart';
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
