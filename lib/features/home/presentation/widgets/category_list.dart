import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';

class CategoryList extends StatefulWidget {
  CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<String> categories = [
    "Phones",
    "Computer",
    "Health",
    "Books",
    "Watchs",
    "Others"
  ];

  final List<IconData> icons = [
    Icons.smartphone,
    Icons.computer,
    Icons.favorite_border_outlined,
    Icons.book_outlined,
    Icons.watch,
    Icons.devices_other
  ];

  final List<String> svgicons = [
    AppIcons.phone,
    AppIcons.computer,
    AppIcons.health,
    AppIcons.books,
    AppIcons.books,
    AppIcons.books
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    child: SvgPicture.asset(
                      svgicons[index],
                      width: 18,
                      height: 18,
                      fit: BoxFit.none,
                      color: selectedIndex == index
                          ? Colors.white
                          : AppColors.gray,
                    ),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? AppColors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(35)),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(categories[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? AppColors.orange
                            : AppColors.blue))
              ],
            ),
          );
        });
  }
}
