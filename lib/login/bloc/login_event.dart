part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UserEmailChanged extends LoginEvent {
  final String email;

  const UserEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class UserPasswordChanged extends LoginEvent {
  final String password;

  const UserPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginPasswordObsecurityChanged extends LoginEvent {}

class LoginSubmitted extends LoginEvent {}

class SignupSubmitted extends LoginEvent {}
