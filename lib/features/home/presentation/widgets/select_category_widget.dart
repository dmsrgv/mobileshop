import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/home/presentation/widgets/category_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    Key? key,
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
                AppLocalizations.of(context)!.selectCategory,
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
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 120,
          width: SizeConfig.screenWidth,
          child: CategoryList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.search,
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                width: SizeConfig.blockSizeHorizontal! * 65,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(18)),
                child: SvgPicture.asset(
                  AppIcons.qrcode,
                  color: Colors.white,
                  fit: BoxFit.none,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
