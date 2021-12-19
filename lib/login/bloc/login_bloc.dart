import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/auth/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc()
      : _authRepository = AuthRepository(),
        super(const LoginState()) {
    on<UserEmailChanged>(_onUserEmailChanged);
    on<UserPasswordChanged>(_onUserPasswordChanged);
    on<LoginPasswordObsecurityChanged>(_onLoginPasswordObsecurityChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<SignupSubmitted>(_onSignupSignupSubmitted);
  }

  void _onUserEmailChanged(UserEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(userEmail: event.email));
  }

  void _onUserPasswordChanged(UserPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(userPassword: event.password));
  }

  void _onLoginPasswordObsecurityChanged(LoginPasswordObsecurityChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(obsecurePassword: !state.obsecurePassword));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final result =
        await _authRepository.signInWithEmailAndPassword(email: state.userEmail, password: state.userPassword);
    emit(state.copyWith(isLoading: true));
    if (result.error == null) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  void _onSignupSignupSubmitted(SignupSubmitted event, Emitter<LoginState> emit) async {
    final result =
        await _authRepository.signUpWithEmailAndPassword(email: state.userEmail, password: state.userPassword);
    emit(state.copyWith(isLoading: true));
    if (result.error == null) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }
}
