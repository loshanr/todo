part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeEvent {}

class TodoLoaded extends HomeEvent {
  final List<Todo> todos;

  const TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoAdded extends HomeEvent {
  final Todo todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoCompletedPressed extends HomeEvent {
  final Todo todo;

  const TodoCompletedPressed(this.todo);

  @override
  List<Object> get props => [todo];
}
