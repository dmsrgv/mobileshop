import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectDetails extends StatefulWidget {
  List<ProductDetailsEntity> items;

  SelectDetails({required this.items});

  @override
  _SelectDetailsState createState() => _SelectDetailsState();
}

class _SelectDetailsState extends State<SelectDetails> {
  int _selectedColorIndex = 0;
  int _selectedCapacityIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<dynamic> colorDetail = widget.items[0].color;
    List<dynamic> capacityDetail = widget.items[0].capacity;
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.selectColorAndCapacity,
            style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 50,
                  width: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colorDetail.length,
                      itemBuilder: (context, index) {
                        int color = int.parse(
                            colorDetail[index].replaceAll("#", "0xFF"));
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColorIndex = index;
                              });
                            },
                            child: Container(
                              child: _selectedColorIndex == index
                                  ? SvgPicture.asset(
                                      AppIcons.done,
                                      fit: BoxFit.none,
                                    )
                                  : Container(),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(color),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: capacityDetail.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCapacityIndex = index;
                                });
                              },
                              child: Container(
                                child: Text(
                                  capacityDetail[index],
                                  style: TextStyle(
                                      color: _selectedCapacityIndex == index
                                          ? Colors.white
                                          : Color(0xFF8D8D8D),
                                      fontWeight: FontWeight.w700),
                                ),
                                alignment: Alignment.center,
                                width: 70,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _selectedCapacityIndex == index
                                        ? AppColors.orange
                                        : Colors.white),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
