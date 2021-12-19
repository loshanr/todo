part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {}

class AppStatusChanged extends AppEvent {
  final User? user;

  AppStatusChanged(this.user);

  @override
  List<Object?> get props => [user];
}
