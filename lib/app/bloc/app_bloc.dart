import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/auth/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  late StreamSubscription _authStreamSubscription;
  late final AuthRepository _authRepository;

  AppBloc()
      : _authRepository = AuthRepository(),
        super(const AppState()) {
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppSignoutRequested>(_onAppSignoutRequested);
    _authStreamSubscription = _authRepository.onAuthStateChanged.listen((user) {
      add(AppStatusChanged(user));
    });
  }

  @override
  Future<void> close() {
    _authStreamSubscription.cancel();
    return super.close();
  }

  void _onAppStatusChanged(AppStatusChanged event, Emitter<AppState> emit) {
    if (event.user != null) {
      emit(AppState(status: AppStatus.authenticated, user: event.user));
    } else {
      emit(const AppState(status: AppStatus.unauthenticated));
    }
  }

  void _onAppSignoutRequested(AppSignoutRequested event, Emitter<AppState> emit) {
    _authRepository.signOut();
  }
}
