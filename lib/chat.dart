import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';
import 'package:flutter_application/widgets/chatBubble.dart';
import 'package:flutter_application/widgets/chatInput.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<ChatMessage> _messages = [];

  @override
  void initState() {
    loadInitialMessages();
    super.initState();
  }

  void loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/chat_messages.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<ChatMessage> chatMessages = decodedList.map((e){
      return ChatMessage.fromJson(e);
    }).toList();

    setState(() {
      _messages = chatMessages;
    });
  }

  void onMessageSent(ChatMessage chatMessage) {
    _messages.add(chatMessage);
    setState(() {});
  }

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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                    chatMessage: _messages[index],
                    alignment: username == _messages[index].author.username ? Alignment.centerRight : Alignment.centerLeft
                );
              }
            ),
          ),
          ChatInput(onSendMessage: onMessageSent, username: username)
        ],
      ),
    );
  }
}
