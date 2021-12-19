import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/login/bloc/login_bloc.dart';
import 'package:todo_app/login/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blue,
            body: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Text('TODO App', style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white)),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const LoginFormWidget(),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (_, state) {
                    return Visibility(
                      visible: state.isLoading,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Colors.black54),
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
