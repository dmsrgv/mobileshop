import 'package:flutter/material.dart';

class DetailCategoryList extends StatefulWidget {
  DetailCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailCategoryList> createState() => _DetailCategoryListState();
}

class _DetailCategoryListState extends State<DetailCategoryList> {
  final List<String> categories = [
    "Shop",
    "Details",
    "Features",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                            fontFamily: 'Mark Pro',
                            fontSize: 18,
                            fontWeight: selectedIndex == index
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: selectedIndex == index
                                ? Color(0xFF010035)
                                : Colors.black.withOpacity(0.5))),
                  ),
                  selectedIndex == index
                      ? Container(
                          width: 70,
                          height: 2,
                          color: Color(0xFFFF6E4E),
                        )
                      : Container()
                ],
              ),
            );
          }),
    );
  }
}
