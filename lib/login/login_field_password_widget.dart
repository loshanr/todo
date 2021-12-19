import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/login/bloc/login_bloc.dart';

class LoginFieldPasswordWidget extends StatelessWidget {
  const LoginFieldPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: GestureDetector(
              child: Icon(state.obsecurePassword ? Icons.visibility : Icons.visibility_off),
              onTap: () => context.read<LoginBloc>().add(LoginPasswordObsecurityChanged()),
            ),
          ),
          obscureText: true,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
