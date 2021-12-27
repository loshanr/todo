import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/todo.dart';
import 'package:todo_app/home/bloc/home_bloc.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(todo.completed ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded),
        onPressed: () => context.read<HomeBloc>().add(TodoCompletedPressed(todo)),
      ),
      title: Text(todo.title),
      subtitle: Text(todo.description ?? ''),
      onTap: () {
        // Navigator.pushNamed(context, '/detail');
      },
    );
  }
}
