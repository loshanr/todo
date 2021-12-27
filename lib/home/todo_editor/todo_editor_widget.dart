import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/todo.dart';

class TodoEditorWidget extends StatefulWidget {
  const TodoEditorWidget({Key? key}) : super(key: key);

  @override
  State<TodoEditorWidget> createState() => _TodoEditorWidgetState();
}

class _TodoEditorWidgetState extends State<TodoEditorWidget> {
  late String? todoTitle;
  late String? todoDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Todo', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => todoTitle = value,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => todoDescription = value,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(todoTitle != null && todoTitle!.isNotEmpty
                    ? Todo(title: todoTitle!, description: todoDescription)
                    : null),
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
