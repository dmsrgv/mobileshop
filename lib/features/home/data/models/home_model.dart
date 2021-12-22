import 'package:mobileshop/features/home/domain/entities/home_entity.dart';

import 'bestseller_model.dart';
import 'homestore_model.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required id,
    required List<HomeStoreModel> homeStore,
    required List<BestSellerModel> bestSeller,
  }) : super(id: id, homeStore: homeStore, bestSeller: bestSeller);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        id: json['_id'] as String,
        homeStore: List<HomeStoreModel>.from(
            json['home_store'].map((x) => HomeStoreModel.fromJson(x))).toList(),
        bestSeller: List<BestSellerModel>.from(
                json['best_seller'].map((x) => BestSellerModel.fromJson(x)))
            .toList());
  }
  Map<String, dynamic> toJson() {
    //List<HomeStoreModel>? homeStore;
    //List<BestSellerModel>? bestSeller;
    return {
      '_id': id,
      'home_store': homeStore.map((e) => e.toJson()),
      'best_seller': bestSeller.map((e) => e.toJson())
    };
  }

  Map<String, dynamic> toMap() {
    //List<HomeStoreModel>? homeStore;
    //List<BestSellerModel>? bestSeller;
    return {
      '_id': id,
      'home_store': homeStore.map((e) => e.toMap().toString()),
      'best_seller': bestSeller.map((e) => e.toMap().toString())
    };
  }
}
