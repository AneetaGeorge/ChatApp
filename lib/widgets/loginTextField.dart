import 'package:flutter/material.dart';
import 'package:flutter_application/utilities/textFieldStyle.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  const LoginTextField({super.key, required this.controller, required this.hintText,
  this.obscureText = false, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: ThemeTextStyle.loginTextStyle,
          border: const OutlineInputBorder()
      ),
    );
  }
}
