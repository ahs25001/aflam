part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class ChangeModeEvent extends AppEvent {}

class SaveModeEvent extends AppEvent {
  String mode ;

  SaveModeEvent(this.mode);
}
