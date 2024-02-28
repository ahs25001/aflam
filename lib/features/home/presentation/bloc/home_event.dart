part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetPopularEvent extends HomeEvent {}

class GetNewReleasesEvent extends HomeEvent {}

class GetRecommendedEvent extends HomeEvent {}

class ChangeTabEvent extends HomeEvent {
  int newIndex;

  ChangeTabEvent(this.newIndex);
}
