import 'package:flutter/material.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TotalText extends StatelessWidget {
  const TotalText({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CartEntity> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.total,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            '\$' + items[0].total.toString() + ' us',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

//Не изменяем, второй PULL REQUEST
