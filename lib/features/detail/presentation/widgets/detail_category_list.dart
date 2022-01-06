import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailCategoryList extends StatefulWidget {
  DetailCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailCategoryList> createState() => _DetailCategoryListState();
}

class _DetailCategoryListState extends State<DetailCategoryList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      AppLocalizations.of(context)!.shop,
      AppLocalizations.of(context)!.details,
      AppLocalizations.of(context)!.features,
    ];
    return Container(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    (AppLocalizations.of(context)!.language) == 'English'
                        ? 30
                        : 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(categories[index],
                        style: TextStyle(
                            fontSize:
                                (AppLocalizations.of(context)!.language) ==
                                        'English'
                                    ? 18
                                    : 14,
                            fontWeight: selectedIndex == index
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: selectedIndex == index
                                ? AppColors.blue
                                : Colors.black.withOpacity(0.5))),
                  ),
                  selectedIndex == index
                      ? Container(
                          width: 70,
                          height: 2,
                          color: AppColors.orange,
                        )
                      : Container()
                ],
              ),
            );
          }),
    );
  }
}
