import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:mobileshop/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final BestSellerEntity? items;

  const ProductDetailsScreen({Key? key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      List<ProductDetailsEntity> productDetailsList = [];
      if (state is DetailLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is DetailErrorState) {
        return const Center(
          child: Text('ERROR'),
        );
      }

      if (state is DetailInitialState) {
        return const Center(
          child: Text('INITIAL ERROR'),
        );
      }

      if (state is DetailLoadedState) {
        productDetailsList = state.loadedData as List<ProductDetailsEntity>;
        final List<dynamic> imagesList = productDetailsList[0].images;
        return Scaffold(
          backgroundColor: const Color(0xFFE5E5E5),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFF010035),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Product Details',
                        style: TextStyle(
                            color: Color(0xFF010035),
                            fontFamily: 'Mark Pro',
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen()));
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF6E4E),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.local_grocery_store,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                    itemCount: imagesList.length,
                    itemBuilder: (context, index, page) {
                      return ImageView(imagesList[index]);
                    },
                    options: CarouselOptions(autoPlay: true, height: 240)),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productDetailsList[0].title,
                                style: const TextStyle(
                                    color: Color(0xFF010035),
                                    fontFamily: 'Mark Pro',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xFF010035),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productDetailsList[0].rating.toInt(),
                                itemBuilder: (context, index) {
                                  return const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFFFB800),
                                    ),
                                  );
                                }),
                          ),
                          Container(height: 30, child: DetailCategoryList()),
                          DetailsPhone(
                            productDetailsList: productDetailsList,
                          ),
                          SelectDetails(items: productDetailsList),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFF6E4E)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  ),
                                  Text(
                                    '\$' +
                                        productDetailsList[0].price.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                )
              ],
            ),
          ),
        );
      }
      return const Center(
        child: Text('ERROR BLOC'),
      );
    });
  }
}

class ImageView extends StatelessWidget {
  String? imgUrl;

  ImageView(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(
          imgUrl!,
          fit: BoxFit.cover,
        ));
  }
}

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
    return ListView.builder(
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
        });
  }
}

class DetailsPhone extends StatelessWidget {
  List<ProductDetailsEntity> productDetailsList;

  DetailsPhone({required this.productDetailsList});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Icon(
                Icons.memory,
                size: 40,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].cpu.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                size: 40,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].camera.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.storage,
                size: 40,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].ssd.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.sd_card,
                size: 40,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].sd.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

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
            'Select color and capacity',
            style: TextStyle(
                color: Color(0xFF010035),
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
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
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
                                        ? Color(0xFFFF6E4E)
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
