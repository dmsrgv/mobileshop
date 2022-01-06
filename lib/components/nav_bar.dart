import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:mobileshop/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    List<String> titles = [
      AppLocalizations.of(context)!.explorer,
      AppLocalizations.of(context)!.cart,
      AppLocalizations.of(context)!.favorites,
      AppLocalizations.of(context)!.profile
    ];
    List<String> svgicons = [
      AppIcons.phone,
      AppIcons.cart,
      AppIcons.like,
      AppIcons.profile
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
          height: 70,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: svgicons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth! / 15),
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
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: (AppLocalizations.of(context)!
                                                  .language) ==
                                              'English'
                                          ? 15
                                          : 12,
                                    ),
                                  )
                                ],
                              )
                            : SvgPicture.asset(
                                svgicons[index],
                                height: 18,
                                width: 18,
                                color: Colors.white,
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
