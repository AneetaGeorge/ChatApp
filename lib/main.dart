import 'package:flutter/material.dart';
import 'package:flutter_application/chat.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/services/authService.dart';
import 'package:provider/provider.dart';

void main() async {
  //Calling this method as AuthService.init() is interacting with native code (Shared Preferences)
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(Provider(
    create: (BuildContext context) => AuthService(),
    child: const ChatApp(),
    )
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black
          )
      ),
      home: Login(),
      routes: {
        '/chat': (context) => const Chat()
      },
    );
  }

}
