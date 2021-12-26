import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home/bloc/home_bloc.dart';
import 'package:todo_app/home/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (_, index) => const Divider(color: Colors.black),
          itemCount: state.todos.length,
          itemBuilder: (_, index) {
            return TodoWidget(todo: state.todos[index]);
          },
        );
      },
    );
  }
}
