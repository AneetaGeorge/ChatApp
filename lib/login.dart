import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              )
            ],
          ),
        )
    );
  }
}