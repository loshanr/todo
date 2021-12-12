import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppEvent>((event, emit) {
      on<AppStatusChanged>(_onAppStatusChanged);
    });
  }

  void _onAppStatusChanged(AppStatusChanged event, Emitter<AppState> emit) {
    emit(AppState(status: event.status));
  }
}
