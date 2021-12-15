part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<dynamic> loadedData;

  HomeLoadedState({required this.loadedData});

  List<dynamic> get getDetails => loadedData;

  @override
  List<Object> get props => [loadedData];
}

class HomeErrorState extends HomeState {}
