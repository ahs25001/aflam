import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
 static  AppBloc get(BuildContext context) =>BlocProvider.of(context);
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      if (event is ChangeModeEvent) {
        emit(state.copyWith(
            mode: (state.mode == Mode.dark) ? Mode.light : Mode.dark));
      }
    });
  }
}
