part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final List<ProductDetailsEntity> loadedData;

  DetailLoadedState({required this.loadedData});

  @override
  List<Object> get props => [loadedData];
}

class DetailErrorState extends DetailState {}
