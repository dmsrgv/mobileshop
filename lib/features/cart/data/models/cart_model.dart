import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required String id,
    required List<BasketEntity> basket,
    required int total,
    required String delivery,
  }) : super(id: id, basket: basket, total: total, delivery: delivery);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['_id'] as String,
        basket: List<BasketModel>.from(
            json['basket'].map((x) => BasketModel.fromJson(x))).toList(),
        total: json['total'] as int,
        delivery: json['Delivery'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'basket': basket.map((e) => e.toJson()),
      'total': total,
      'Delivery': delivery
    };
  }
}

class BasketModel extends BasketEntity {
  BasketModel({
    required String title,
    required String image,
    required int price,
  }) : super(title: title, image: image, price: price);

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
        title: json['title'] as String,
        image: json['image'] as String,
        price: json['price'] as int);
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'price': price,
    };
  }
}
