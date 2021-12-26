import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(todo.completed ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded),
      title: Text(todo.title),
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
    );
  }
}
