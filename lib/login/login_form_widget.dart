import 'package:flutter/material.dart';
import 'package:todo_app/login/login_field_email_widget.dart';
import 'package:todo_app/login/login_field_password_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          LoginFieldEmailWidget(),
          SizedBox(height: 8),
          LoginFieldPasswordWidget(),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false),
                child: Text('Login')),
          ),
          TextButton(onPressed: () {}, child: Text('Sign up'))
        ],
      ),
    );
  }
}
