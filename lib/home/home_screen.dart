import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home/bloc/home_bloc.dart';
import 'package:todo_app/home/home_appbar_widget.dart';
import 'package:todo_app/home/home_drawer_widget.dart';
import 'package:todo_app/home/todo_editor_bottomsheet_widget.dart';
import 'package:todo_app/home/todo_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Scaffold(
        appBar: const HomeAppBarWidget(),
        body: const TodoListWidget(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
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
                return const TodoEditorBottomsheetWidget();
              },
            );
          },
        ),
        drawer: const HomeDrawerWidget(),
      ),
    );
  }
}
