import 'package:flutter/material.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';

class ItemCard extends StatelessWidget {
  final HomeEntity item;
  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<HomeStoreEntity> phone = item.homeStore;
    return Container(
      width: 200,
      height: 200,
      child: Text('${phone[0].title}'),
    );
  }
}
