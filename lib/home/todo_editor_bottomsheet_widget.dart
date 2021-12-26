import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home/todo_editor/bloc/todo_editor_bloc.dart';
import 'package:todo_app/home/todo_editor/todo_editor_widget.dart';

class TodoEditorBottomsheetWidget extends StatelessWidget {
  const TodoEditorBottomsheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoEditorBloc(),
      child: const TodoEditorWidget(),
    );
  }
}
