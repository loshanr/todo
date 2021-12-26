part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<Todo> todos;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.todos = const [],
    this.error,
  });

  @override
  List<Object?> get props => [isLoading, todos, error];

  HomeState copyWith({
    bool? isLoading,
    List<Todo>? todos,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
      error: error ?? this.error,
    );
  }
}
