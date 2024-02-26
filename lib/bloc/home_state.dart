part of 'home_bloc.dart';

class HomeState {
  final APIState apiState;

  HomeState({required this.apiState});

  HomeState copWith(newAPIState) {
    return HomeState(apiState: newAPIState ?? apiState);
  }
}