import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';

class HomeStoreModel extends HomeStoreEntity {
  HomeStoreModel({
    required id,
    required is_new,
    required is_favorites,
    required title,
    required subtitle,
    required picture,
    required is_buy,
  }) : super(
          id: id,
          is_new: is_new,
          is_favorites: is_favorites,
          title: title,
          subtitle: subtitle,
          picture: picture,
          is_buy: is_buy,
        );

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) {
    return HomeStoreModel(
        id: json['id'] as int,
        is_new: json['is_new'],
        is_favorites: json['is_favorites'],
        title: json['title'],
        subtitle: json['subtitle'],
        picture: json['picture'],
        is_buy: json['is_buy']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_new': is_new,
      'is_favorites': is_favorites,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'is_buy': is_buy,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'is_new': is_new == null ? 0 : 1,
      'is_favorites': is_favorites == null ? 0 : 1,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'is_buy': is_buy ? 1 : 0,
    };
  }
}
