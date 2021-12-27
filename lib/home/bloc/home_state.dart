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

  factory HomeState.fromMap(Map<String, dynamic> map) => HomeState(
        todos: List<Todo>.from(map['todos'].map((x) => Todo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'todos': List<Map<String, dynamic>>.from(todos.map((x) => x.toMap())),
      };
}
