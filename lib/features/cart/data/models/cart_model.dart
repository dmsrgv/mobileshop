import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required id,
    required List<BasketModel> basket,
    required total,
    required delivery,
  }) : super(id: id, basket: basket, total: total, delivery: delivery);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['_id'] as String,
        basket: List<BasketModel>.from(
            json['basket'].map((x) => BasketModel.fromJson(x))).toList(),
        total: json['total'] as int,
        delivery: json['delivery'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'basket': basket.map((e) => e.toJson()),
      'total': total,
      'delivery': delivery
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'basket': basket.map((e) => e.toMap()),
      'total': total,
      'delivery': delivery
    };
  }
}

class BasketModel extends BasketEntity {
  BasketModel({
    required title,
    required image,
    required price,
  }) : super(title: title, image: image, price: price);

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
        title: json['title'] as String,
        image: json['images'] as String,
        price: json['price'] as int);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'images': image,
      'price': price,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'images': image,
      'price': price,
    };
  }
}
