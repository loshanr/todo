import 'package:flutter/material.dart';
import 'package:todo_app/login/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Container(
            margin: EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Text('TODO App', style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white)),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: LoginFormWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
