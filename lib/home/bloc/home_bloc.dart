import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_app/features/todo/todo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  // final TodoRepository _todoRepository;
  late final StreamSubscription _todoSubscription;

  HomeBloc()
      : //_todoRepository = TodoRepository(),
        super(const HomeState()) {
    on<HomeLoaded>(_onHomeLoaded);
    on<TodoLoaded>(_onTodoLoaded);
    on<TodoAdded>(_onTodoAdded);
    on<TodoCompletedPressed>(_onTodoCompletedPressed);
    on<TodoDeleted>(_onTodoDeleted);
    on<TodoUpdated>(_onTodoUpdated);
    // _todoSubscription = _todoRepository.getTodos().listen((todos) {
    //   add(TodoLoaded(todos));
    // });
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
    todos.insert(0, event.todo);
    emit(state.copyWith(todos: todos));
  }

  void _onTodoCompletedPressed(TodoCompletedPressed event, Emitter<HomeState> emit) {
    List<Todo> todos = List.from(state.todos);
    todos.removeWhere((todo) => todo == event.todo);
    if (!event.todo.completed) {
      todos.add(event.todo.copyWith(completed: !event.todo.completed));
    } else {
      todos.insert(0, event.todo.copyWith(completed: !event.todo.completed));
    }

    emit(state.copyWith(todos: todos));
  }

  void _onTodoDeleted(TodoDeleted event, Emitter<HomeState> emit) {
    List<Todo> todos = List.from(state.todos);
    todos.removeWhere((todo) => todo == event.todo);
    emit(state.copyWith(todos: todos));
  }

  void _onTodoUpdated(TodoUpdated event, Emitter<HomeState> emit) {
    List<Todo> todos = List.from(state.todos);
    int index = todos.indexWhere((todo) => todo.id == event.todo.id);
    todos[index] = event.todo;
    emit(state.copyWith(todos: todos));
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    try {
      return HomeState.fromMap(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    try {
      return state.toMap();
    } catch (e) {
      return null;
    }
  }
}
