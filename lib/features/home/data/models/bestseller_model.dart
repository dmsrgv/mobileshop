import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';

class BestSellerModel extends BestSellerEntity {
  BestSellerModel({
    required int id,
    required is_favorites,
    required title,
    required int price_without_discount,
    required int discount_price,
    required picture,
  }) : super(
            id: id,
            is_favorites: is_favorites,
            title: title,
            price_without_discount: price_without_discount,
            discount_price: discount_price,
            picture: picture);

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
        id: json['id'] as int,
        is_favorites: json['is_favorites'],
        title: json['title'],
        price_without_discount: json['price_without_discount'] as int,
        discount_price: json['discount_price'] as int,
        picture: json['picture']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_favorites': is_favorites,
      'title': title,
      'price_without_discount': price_without_discount,
      'discount_price': discount_price,
      'picture': picture
    };
  }
}
