part of 'app_bloc.dart';

enum AppStatus { unknown, unauthenticated, authenticated }

class AppState extends Equatable {
  final AppStatus status;
  final User? user;

  const AppState({this.status = AppStatus.unknown, this.user});

  @override
  List<Object?> get props => [status, user];
}
