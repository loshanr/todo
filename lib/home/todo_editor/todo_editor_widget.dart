import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/todo.dart';

class TodoEditorWidget extends StatefulWidget {
  final Todo? todo;
  const TodoEditorWidget({this.todo, Key? key}) : super(key: key);

  @override
  State<TodoEditorWidget> createState() => _TodoEditorWidgetState();
}

class _TodoEditorWidgetState extends State<TodoEditorWidget> {
  late String? todoTitle = widget.todo?.title;
  late String? todoDescription = widget.todo?.description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.todo != null ? 'Update Todo' : 'Create Todo', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              initialValue: widget.todo?.title,
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
              initialValue: widget.todo?.description,
              onChanged: (value) => todoDescription = value,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(todoTitle != null && todoTitle!.isNotEmpty
                    ? widget.todo != null
                        ? widget.todo!.copyWith(title: todoTitle, description: todoDescription)
                        : Todo(id: Timestamp.now().toString(), title: todoTitle!, description: todoDescription)
                    : null),
                child: Text(widget.todo != null ? 'Update' : 'Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
