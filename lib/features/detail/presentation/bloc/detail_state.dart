part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final List<dynamic> loadedData;

  DetailLoadedState({required this.loadedData});

  List<dynamic> get getDetails => loadedData;

  @override
  List<Object> get props => [loadedData];
}

class DetailErrorState extends DetailState {}
