part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {}

class AppStatusChanged extends AppEvent {
  final AppStatus status;

  AppStatusChanged(this.status);

  @override
  List<Object?> get props => [status];
}
