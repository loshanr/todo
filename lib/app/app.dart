import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/bloc/app_bloc.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/login/login_screen.dart';
import 'package:todo_app/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO-DO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (_, child) {
        return BlocListener<AppBloc, AppState>(
          listener: (_, state) {
            if (state.status == AppStatus.unauthenticated) {
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
            } else if (state.status == AppStatus.authenticated) {
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
            }
          },
          child: child,
        );
      },
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
        // '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
