import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/todo.dart';
import 'package:todo_app/home/bloc/home_bloc.dart';
import 'package:todo_app/home/todo_editor_bottomsheet_widget.dart';

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
      trailing: IconButton(
        icon: const Icon(Icons.delete_rounded),
        onPressed: () => context.read<HomeBloc>().add(TodoDeleted(todo)),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TodoEditorBottomsheetWidget(todo: todo),
            );
          },
        ).then((value) => value != null ? context.read<HomeBloc>().add(TodoUpdated(value)) : null);
      },
    );
  }
}
