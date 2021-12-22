import 'package:equatable/equatable.dart';

class HomeStoreEntity extends Equatable {
  final int id;
  final bool is_new;
  final bool is_favorites;
  final String title;
  final String subtitle;
  final String picture;
  final bool is_buy;

  HomeStoreEntity({
    required this.id,
    required this.is_new,
    required this.is_favorites,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.is_buy,
  });

  @override
  List<Object?> get props =>
      [id, is_new, is_favorites, title, subtitle, picture, is_buy];

  toMap() {}

  toJson() {}
}
