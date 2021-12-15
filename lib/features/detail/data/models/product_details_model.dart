import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required String id,
    required List<dynamic> images,
    required bool is_favorites,
    required String title,
    required double rating,
    required String cpu,
    required String camera,
    required String ssd,
    required String sd,
    required List<dynamic> color,
    required List<dynamic> capacity,
    required int price,
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
}
