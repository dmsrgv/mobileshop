import 'package:flutter/material.dart';

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
                    child: Icon(
                      icons[index],
                      size: 30,
                      color: selectedIndex == index
                          ? Colors.white
                          : Color(0xFFB3B3C3),
                    ),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Color(0xFFFF6E4E)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(35)),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(categories[index],
                    style: TextStyle(
                        fontFamily: 'Mark Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? Color(0xFFFF6E4E)
                            : Color(0xFF010035)))
              ],
            ),
          );
        });
  }
}
