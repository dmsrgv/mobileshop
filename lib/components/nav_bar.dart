import 'package:flutter/material.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:mobileshop/features/home/presentation/pages/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Icon(
      Icons.local_grocery_store,
      size: 150,
    ),
    Icon(
      Icons.favorite,
      size: 150,
    ),
    Icon(
      Icons.person,
      size: 150,
    ),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> titles = ['Explorer', 'Cart', 'Favorites', 'Profile'];
    List<IconData> data = [
      Icons.home_outlined,
      Icons.local_grocery_store_outlined,
      Icons.favorite_outline,
      Icons.person_outline,
    ];
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      bottomNavigationBar: Material(
        elevation: 10,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: const Color(0xFF010035),
        child: Container(
          width: double.infinity,
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        selectedIndex == index
                            ? Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    titles[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            : Icon(
                                data[index],
                                color: Colors.white,
                                size: 30,
                              )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
      body: Center(child: _pages.elementAt(selectedIndex)),
    );
  }
}
