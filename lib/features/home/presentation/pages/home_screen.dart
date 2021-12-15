import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/detail/presentation/pages/product_details_screen.dart';
import 'package:mobileshop/features/home/data/models/homestore_model.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';
import 'package:mobileshop/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      List<HomeEntity> items = [];
      if (state is HomeLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomeErrorState) {
        return const Center(
          child: Text('ERROR'),
        );
      }

      if (state is HomeInitialState) {
        return const Center(
          child: Text('INITIAL ERROR'),
        );
      }

      if (state is HomeLoadedState) {
        items = state.loadedData as List<HomeEntity>;
        List<HomeStoreEntity> listHomeStore = items[0].homeStore;
        List<BestSellerEntity> listBestSeller = items[0].bestSeller;
        return Scaffold(
          backgroundColor: const Color(0xFFE5E5E5),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const LocationWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SelectCategoryWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  HotSalesWidget(
                    items: listHomeStore,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BestSellerWidget(items: listBestSeller),
                ],
              ),
            ),
          )),
        );
      }
      return const Center(
        child: Text('ERROR BLOC'),
      );
    });
  }
}

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
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: Color(0xFFFF6E4E),
            ),
            SizedBox(
              width: 11,
            ),
            Text(
              'Zihuatanejo, Gro',
              style: TextStyle(
                  color: Color(0xFF010035),
                  fontSize: 15,
                  fontFamily: 'Mark Pro',
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.expand_more,
              color: Color(0xFFB3B3B3),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.filter_list,
            color: Color(0xFF010035),
          ),
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
                                        color: Color(0xFF010035),
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
                                  const Text(
                                    'Filter options',
                                    style: TextStyle(
                                        color: Color(0xFF010035),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mark Pro'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Done'),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFFFF6E4E))),
                                  )
                                ],
                              ),
                            ),
                            const Text(
                              'Brand',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mark Pro'),
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
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mark Pro'),
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
                            const Text(
                              'Size',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mark Pro'),
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

class DropDownList extends StatefulWidget {
  final List<String> listItems;
  final String selectedItem;

  const DropDownList({
    Key? key,
    required this.listItems,
    required this.selectedItem,
  }) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    String? _selectedItem = widget.selectedItem;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 60,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          value: _selectedItem,
          isExpanded: true,
          style: TextStyle(color: Colors.black),
          items: widget.listItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedItem = newValue;
            });
          },
        ),
      ),
    );
  }
}

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
            children: const [
              Text(
                'Best Seller',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010035)),
              ),
              Text(
                'see more',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF6E4E)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40),
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
                              Image.network(
                                items[index].picture.toString(),
                                width: 150,
                                height: 150,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$' + '${items[index].discount_price}',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mark Pro'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '\$' +
                                        '${items[index].price_without_discount}',
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54,
                                        fontFamily: 'Mark Pro'),
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
                          ? const Icon(
                              Icons.favorite,
                              color: Color(0xFFFF6E4E),
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Color(0xFFFF6E4E),
                            ),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
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

class HotSalesWidget extends StatelessWidget {
  final List<HomeStoreEntity> items;

  HotSalesWidget({
    required this.items,
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
            children: const [
              Text(
                'Hot Sales',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010035)),
              ),
              Text(
                'see more',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF6E4E)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 200,
            width: SizeConfig.screenWidth,
            child: PageView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return HotSalesItem(item: items[index]);
                }),
          ),
        )
      ],
    );
  }
}

class HotSalesItem extends StatelessWidget {
  final HomeStoreEntity item;
  const HotSalesItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('${item.picture.toString()}'),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: item.is_new == true
                ? Container(
                    child: const Center(
                        child: Text(
                      'New',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFF6E4E)),
                  )
                : Container(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              item.title.toString(),
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Text(
              item.subtitle.toString(),
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Center(
                  child: Text(
                'Buy now!',
                style: TextStyle(
                    color: Color(0xFF010035),
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              )),
              width: 115,
              height: 25,
            ),
          )
        ],
      ),
    );
  }
}

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
            children: const [
              Text(
                'Select Category',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010035)),
              ),
              Text(
                'view all',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF6E4E)),
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
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                width: SizeConfig.blockSizeHorizontal! * 70,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              const Icon(
                Icons.qr_code_rounded,
                size: 25,
                color: Color(0xFFFF6E4E),
              )
            ],
          ),
        )
      ],
    );
  }
}

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
