import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login()
  {
    print('Username: ${usernameController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('Button clicked!'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Let\'s sign you in!',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5
                ),
              ),
              const Text(
                'Welcome!\n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5
                ),
              ),
              Image.network(
                'https://www.olark.com/img/views/index/howitworks/ChatinRealTime_img.jpg',
                height: 200,
              ),

              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder()
                ),
              ),

              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder()
                ),
              ),

              ElevatedButton(
                onPressed: login,
                child: const Text(
                  'Login'
                ))
            ],
          ),
        )
    );
  }
}