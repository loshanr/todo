part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStatusChanged extends AppEvent {
  final User? user;

  AppStatusChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class AppSignoutRequested extends AppEvent {}
