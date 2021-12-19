import 'package:flutter/material.dart';

class LoginFieldPasswordWidget extends StatelessWidget {
  const LoginFieldPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // suffixIcon: GestureDetector(
        //   child: Icon(state.obsecurePassword ? Icons.visibility : Icons.visibility_off),
        //   onTap: () => context.read<SigninBloc>().add(SigninPasswordObsecureStateChanged()),
        // ),
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
    );
  }
}
