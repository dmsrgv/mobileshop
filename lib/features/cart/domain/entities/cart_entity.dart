import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  late final id;
  final List<BasketEntity> basket;
  final int total;
  final String delivery;

  CartEntity(
      {required this.id,
      required this.basket,
      required this.total,
      required this.delivery});

  @override
  List<Object?> get props => [id, basket, total, delivery];
}

class BasketEntity {
  final String title;
  final String image;
  final int price;

  BasketEntity({required this.title, required this.image, required this.price});

  toJson() {}

  toMap() {}
}
