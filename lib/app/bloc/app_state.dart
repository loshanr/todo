part of 'app_bloc.dart';

enum AppStatus { unknown, unauthenticated, authenticated }

class AppState extends Equatable {
  final AppStatus status;

  AppState({this.status = AppStatus.unauthenticated});

  @override
  List<Object?> get props => [status];
}
