import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/loginTextField.dart';
import 'package:flutter_application/widgets/spaces.dart';

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
        Navigator.pushReplacementNamed(
            context,
            '/chat',
          arguments: usernameController.text
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
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
                    LoginTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return "Username cannot be empty";
                        }
                            return null;
                      },
                      controller: usernameController,
                      hintText: 'Username',
                    ),

                    verticalSpacing(24),

                    LoginTextField(
                      obscureText: true,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
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