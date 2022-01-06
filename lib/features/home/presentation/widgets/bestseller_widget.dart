import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/components/cache_image.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/detail/presentation/pages/product_details_screen.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BestSellerWidget extends StatelessWidget {
  final List<BestSellerEntity> items;
  const BestSellerWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.bestSeller,
                style: TextStyle(
                    fontSize:
                        (AppLocalizations.of(context)!.language) == 'English'
                            ? 25
                            : 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue),
              ),
              Text(
                AppLocalizations.of(context)!.viewAll,
                style: TextStyle(
                    fontSize:
                        (AppLocalizations.of(context)!.language) == 'English'
                            ? 15
                            : 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: SizeConfig.screenWidth! / 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Stack(alignment: Alignment.topRight, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(items: items[index])));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.99),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CacheImage(
                                cover: false,
                                width: SizeConfig.screenWidth! / 3,
                                height: SizeConfig.screenHeight! / 5,
                                imageUrl: items[index].picture.toString(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$' + '${items[index].discount_price}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '\$' +
                                        '${items[index].price_without_discount}',
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                items[index].title,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: items[index].is_favorites == true
                          ? SvgPicture.asset(
                              AppIcons.like_colored,
                              color: AppColors.orange,
                              fit: BoxFit.none,
                            )
                          : SvgPicture.asset(
                              AppIcons.like,
                              color: AppColors.orange,
                              fit: BoxFit.none,
                            ),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: AppColors.bluegray, blurRadius: 15)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ]);
              }),
        )
      ],
    );
  }
}
