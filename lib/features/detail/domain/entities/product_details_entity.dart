import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final id;
  final List<dynamic> images;
  final bool is_favorites;
  final String title;
  final double rating;
  final String cpu;
  final String camera;
  final String ssd;
  final String sd;
  final List<dynamic> color;
  final List<dynamic> capacity;
  final int price;

  const ProductDetailsEntity(
      {required this.id,
      required this.images,
      required this.is_favorites,
      required this.title,
      required this.rating,
      required this.cpu,
      required this.camera,
      required this.ssd,
      required this.sd,
      required this.color,
      required this.capacity,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        images,
        is_favorites,
        title,
        rating,
        cpu,
        camera,
        ssd,
        sd,
        color,
        capacity,
        price
      ];
}
