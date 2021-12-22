import 'package:equatable/equatable.dart';

class BestSellerEntity extends Equatable {
  final int id;
  final bool is_favorites;
  final String title;
  final int price_without_discount;
  final int discount_price;
  final String picture;

  BestSellerEntity({
    required this.id,
    required this.is_favorites,
    required this.title,
    required this.price_without_discount,
    required this.discount_price,
    required this.picture,
  });

  toMap() {}

  toJson() {}

  @override
  List<Object?> get props => [
        id,
        is_favorites,
        title,
        price_without_discount,
        discount_price,
        picture
      ];
}
