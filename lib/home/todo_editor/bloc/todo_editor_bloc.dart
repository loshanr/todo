import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_editor_event.dart';
part 'todo_editor_state.dart';

class TodoEditorBloc extends Bloc<TodoeditorEvent, TodoeditorState> {
  TodoEditorBloc() : super(TodoeditorInitial()) {
    on<TodoeditorEvent>((event, emit) {});
  }
}
