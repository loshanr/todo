import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_app/features/todo/todo.dart';
import 'package:todo_app/features/todo/todo_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  final TodoRepository _todoRepository;
  late final StreamSubscription _todoSubscription;

  HomeBloc()
      : _todoRepository = TodoRepository(),
        super(const HomeState()) {
    on<HomeLoaded>(_onHomeLoaded);
    on<TodoLoaded>(_onTodoLoaded);
    on<TodoAdded>(_onTodoAdded);
    _todoSubscription = _todoRepository.getTodos().listen((todos) {
      add(TodoLoaded(todos));
    });
  }

  @override
  Future<void> close() {
    _todoSubscription.cancel();
    return super.close();
  }

  void _onHomeLoaded(HomeLoaded event, Emitter<HomeState> emit) {
    emit(state.copyWith(isLoading: true));
  }

  void _onTodoLoaded(TodoLoaded event, Emitter<HomeState> emit) {
    emit(state.copyWith(todos: event.todos, isLoading: false));
  }

  void _onTodoAdded(TodoAdded event, Emitter<HomeState> emit) {
    List<Todo> todos = List.from(state.todos);
    todos.add(event.todo);
    emit(state.copyWith(todos: todos));
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    try {
      return HomeState.fromMap(json);
    } catch (e) {
      print('000000000000000');
      print(e);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    try {
      return state.toMap();
    } catch (e) {
      print('1111111111111111');
      print(e);
      return null;
    }
  }
}
