import 'package:flutter/material.dart';

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
            child: Column(
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
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false),
                          child: Text('Login')),
                      TextButton(onPressed: () {}, child: Text('Sign up'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
