import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/todo.dart';
import 'package:todo_app/features/todo/todo_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoRepository _todoRepository;
  late final StreamSubscription _todoSubscription;

  HomeBloc()
      : _todoRepository = TodoRepository(),
        super(const HomeState()) {
    on<HomeLoaded>(_onHomeLoaded);
    on<TodoLoaded>(_onTodoLoaded);
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
}
