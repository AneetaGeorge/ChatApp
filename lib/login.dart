import 'package:flutter/material.dart';
import 'package:flutter_application/chat.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login(context)
  {
    if (_formKey.currentState != null && _formKey.currentState!.validate())
      {
        print('Username: ${usernameController.text}');
        print('Login successful');
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => const Chat()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return "Username cannot be empty";
                        }
                            return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder()
                      ),
                    ),

                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: (){
                  login(context);
                },
                  child: const Text(
                  'Login'
                )
              ),
            ],
          ),
        )
    );
  }
}