import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';
import 'package:flutter_application/services/authService.dart';
import 'package:flutter_application/widgets/chatBubble.dart';
import 'package:flutter_application/widgets/chatInput.dart';
import 'package:provider/provider.dart';

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
    String? userName = context.read<AuthService>().getUser();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Welcome $userName!',
          style: const TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                context.read<AuthService>().logoutUser();
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
              itemBuilder: (context, index)  {
                return ChatBubble(
                    chatMessage: _messages[index],
                    alignment:  userName == _messages[index].author.username ? Alignment.centerRight : Alignment.centerLeft,
                    color: userName == _messages[index].author.username ? Theme.of(context).primaryColor : Colors.black87,
                );
              }
            ),
          ),
          ChatInput(onSendMessage: onMessageSent, username: userName!)
        ],
      ),
    );
  }
}
