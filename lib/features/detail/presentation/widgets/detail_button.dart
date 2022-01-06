import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailButton extends StatelessWidget {
  const DetailButton({
    Key? key,
    required this.productDetailsList,
  }) : super(key: key);

  final List<ProductDetailsEntity> productDetailsList;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: AppColors.orange),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.addToCart,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize:
                      (AppLocalizations.of(context)!.language) == 'English'
                          ? 24
                          : 16),
            ),
            Text(
              '\$' + productDetailsList[0].price.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize:
                      (AppLocalizations.of(context)!.language) == 'English'
                          ? 24
                          : 16),
            )
          ],
        ),
      ),
    );
  }
}
