import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/bloc/app_bloc.dart';
import 'package:todo_app/home/about_screen.dart';
import 'package:todo_app/home/help.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/login/login_screen.dart';
import 'package:todo_app/splash_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

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
              _navigator.pushNamedAndRemoveUntil('/login', (route) => false);
            } else if (state.status == AppStatus.authenticated) {
              _navigator.pushNamedAndRemoveUntil('/home', (route) => false);
            }
          },
          child: child,
        );
      },
      navigatorKey: _navigatorKey,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (_) => const AboutScreen(),
      },
    );
  }
}
