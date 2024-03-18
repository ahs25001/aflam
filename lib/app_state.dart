part of 'app_bloc.dart';

enum Mode {init, light, dark }

@immutable
class AppState {
  Mode? mode;

  AppState({this.mode});

  AppState copyWith({Mode? mode}) {
    return AppState(mode: mode ?? this.mode);
  }
}

class AppInitial extends AppState {
  AppInitial():super(mode: Mode.init);
}
