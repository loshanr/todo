part of 'todo_editor_bloc.dart';

abstract class TodoeditorState extends Equatable {
  const TodoeditorState();

  @override
  List<Object> get props => [];
}

class TodoeditorInitial extends TodoeditorState {}
