import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/shared_preferences/shared_preferences.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  static AppBloc get(BuildContext context) => BlocProvider.of(context);

  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      if (event is ChangeModeEvent) {
        emit(state.copyWith(
            mode: (state.mode == Mode.dark) ? Mode.light : Mode.dark));
        await SharedPreferencesManager.saveStringData(
            "theme", (state.mode == Mode.light) ? "light" : "dark");

      }
      else if ( event is SaveModeEvent){

        emit(state.copyWith(
            mode: (event.mode =="light") ? Mode.light : Mode.dark));
        SharedPreferencesManager.saveStringData(
            "theme", (event.mode =="light") ? "light" : "dark");
      }
    });
  }

// Future<void> saveTheme(String theme) async {
//   sharedPreferences = await SharedPreferences.getInstance();
//   await sharedPreferences!.setString("theme", theme);
// }
}
