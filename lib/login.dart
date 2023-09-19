import 'package:flutter/material.dart';
import 'package:flutter_application/services/authService.dart';
import 'package:flutter_application/widgets/loginTextField.dart';
import 'package:flutter_application/widgets/spaces.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();
  final _mainUrl = 'https://aneeta-george.com';
  final githubUrl = 'https://github.com/AneetaGeorge';
  final _linkedInUrl = 'https://www.linkedin.com/in/aneetageorge99/';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate())
      {
        String userName = usernameController.text;
        context.read<AuthService>().loginUser(userName);
        Navigator.pushReplacementNamed(
            context,
            '/chat',
          arguments: userName
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        drawer: const Drawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                verticalSpacing(24),
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: const DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/illustration.png'
                            )
                        )
                    )
                ),
                verticalSpacing(24),
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
                GestureDetector(
                  onTap: () async {
                    if (! await launch(_mainUrl)) {
                      throw 'Could not launch URL';
                    }
                  },
                  child: Column (
                    children: [
                      const Text('Find us on'),
                      Text(_mainUrl)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.github(onTap: () async {
                      if (! await launch(githubUrl)) {
                      throw 'Could not launch URL';
                      }
                    }),
                    SocialMediaButton.linkedin(onTap: () async {
                      if (! await launch(_linkedInUrl)) {
                        throw 'Could not launch URL';
                      }
                    }, color: Colors.blueAccent)
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}