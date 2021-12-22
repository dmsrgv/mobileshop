import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({
    required id,
    required images,
    required is_favorites,
    required title,
    required double rating,
    required cpu,
    required camera,
    required ssd,
    required sd,
    required color,
    required capacity,
    required price,
  }) : super(
            id: id,
            images: images,
            is_favorites: is_favorites,
            title: title,
            rating: rating,
            cpu: cpu,
            camera: camera,
            ssd: ssd,
            sd: sd,
            color: color,
            capacity: capacity,
            price: price);

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
        id: json['_id'] as String,
        images: json['images'],
        is_favorites: json['is_favorites'] as bool,
        title: json['title'] as String,
        rating: json['rating'] as double,
        cpu: json['cpu'] as String,
        camera: json['camera'] as String,
        ssd: json['ssd'] as String,
        sd: json['sd'] as String,
        color: json['color'],
        capacity: json['capacity'],
        price: json['price'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'images': images,
      'is_favorites': is_favorites,
      'title': title,
      'rating': rating,
      'cpu': cpu,
      'camera': camera,
      'ssd': ssd,
      'sd': sd,
      'color': color,
      'capacity': capacity,
      'price': price
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': 9345,
      'is_favorites': is_favorites ? 1 : 0,
      'title': title,
      'rating': rating.toString(),
      'cpu': cpu == null ? 'kek' : 'lol',
      'camera': camera,
      'ssd': ssd,
      'sd': sd,
      'price': price
    };
  }
}
