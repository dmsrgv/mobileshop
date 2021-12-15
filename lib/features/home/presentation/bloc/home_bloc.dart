import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/usecases/get_all_items.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllItems getAllItems;

  HomeBloc({required this.getAllItems}) : super(HomeInitialState());
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHomeScreenEvent) {
      yield HomeLoadingState();
      final _loadedHomeList =
          await getAllItems.call(PathHomeParams(path: 'main'));
      yield _loadedHomeList.fold((failure) => HomeErrorState(),
          (list) => HomeLoadedState(loadedData: list));
    } else {
      yield HomeInitialState();
    }
  }
}
