import 'package:flutter/material.dart';
import 'package:flutter_application/chat.dart';
import 'package:flutter_application/login.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(primarySwatch: Colors.deepPurple, appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: Login(),
      routes: {
        '/chat': (context) => Chat()
      },
    );
  }

}
