part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoginScreen;
  final bool obsecurePassword;
  final bool isLoading;
  final String userEmail;
  final String userPassword;
  final String errorMessage;

  const LoginState({
    this.isLoginScreen = true,
    this.obsecurePassword = true,
    this.isLoading = false,
    this.userEmail = '',
    this.userPassword = '',
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [
        isLoginScreen,
        obsecurePassword,
        isLoading,
        userEmail,
        userPassword,
        errorMessage,
      ];

  LoginState copyWith({
    bool? isLoginScreen,
    bool? obsecurePassword,
    bool? isLoading,
    String? userEmail,
    String? userPassword,
    String? errorMessage,
  }) {
    return LoginState(
      isLoginScreen: isLoginScreen ?? this.isLoginScreen,
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
      isLoading: isLoading ?? this.isLoading,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
