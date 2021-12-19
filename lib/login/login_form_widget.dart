import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/login/bloc/login_bloc.dart';
import 'package:todo_app/login/login_field_email_widget.dart';
import 'package:todo_app/login/login_field_password_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const LoginFieldEmailWidget(),
          const SizedBox(height: 8),
          const LoginFieldPasswordWidget(),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.read<LoginBloc>().add(LoginSubmitted()),
              child: const Text('Login'),
            ),
          ),
          TextButton(
            onPressed: () => context.read<LoginBloc>().add(SignupSubmitted()),
            child: const Text('Sign up'),
          )
        ],
      ),
    );
  }
}
