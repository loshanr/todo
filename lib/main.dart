import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/app/bloc/app_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AppBloc(),
    child: App(),
  ));
}
