import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/common/constants.dart';
import 'package:mobileshop/components/map_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/drop_down_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 30,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.geo,
              color: AppColors.orange,
            ),
            const SizedBox(
              width: 11,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapScreen()));
              },
              child: Text(
                Constants.city,
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              AppIcons.down_array,
              color: AppColors.gray,
            ),
          ],
        ),
        IconButton(
          icon: SvgPicture.asset(AppIcons.filter),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                context: context,
                builder: (context) => Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.filterOptions,
                                    style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: (AppLocalizations.of(context)!
                                                  .language) ==
                                              'English'
                                          ? 16
                                          : 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.done),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.orange)),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.brand,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            DropDownList(
                              listItems: [
                                'Samsung',
                                'Xiaomi',
                                'Iphone',
                                'Motorolla'
                              ],
                              selectedItem: 'Samsung',
                            ),
                            Text(
                              AppLocalizations.of(context)!.price,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            DropDownList(
                              listItems: [
                                '\$300 - \$500',
                                '\$500 - \$1000',
                                '\$1000 - \$3000',
                                '\$3000 - \$5000',
                                '\$5000 - \$7000',
                                '\$7000 - \$10000',
                              ],
                              selectedItem: '\$300 - \$500',
                            ),
                            Text(
                              AppLocalizations.of(context)!.size,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            DropDownList(
                              listItems: [
                                '4.5 to 5.5 inches',
                                '5.5 to 6.2 inches',
                                '6.2 to 6.5 inches',
                              ],
                              selectedItem: '4.5 to 5.5 inches',
                            ),
                          ],
                        ),
                      ),
                      height: 400,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                    ));
          },
        ),
      ],
    );
  }
}
