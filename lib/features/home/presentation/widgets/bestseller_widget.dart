import 'package:flutter/material.dart';
import 'package:mobileshop/features/detail/presentation/pages/product_details_screen.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';

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
