import 'package:equatable/equatable.dart';
import 'package:mobileshop/features/home/data/models/homestore_model.dart';

import 'bestseller_entity.dart';
import 'homestore_entity.dart';

class HomeEntity extends Equatable {
  final id;
  final List<HomeStoreEntity> homeStore;
  final List<BestSellerEntity> bestSeller;

  const HomeEntity(
      {required this.id, required this.homeStore, required this.bestSeller});

  @override
  List<Object?> get props => [id, homeStore, bestSeller];
}
