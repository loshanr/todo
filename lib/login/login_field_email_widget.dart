import 'package:flutter/material.dart';

class LoginFieldEmailWidget extends StatelessWidget {
  const LoginFieldEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
