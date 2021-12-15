import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobileshop/features/cart/presentation/bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      List<CartEntity> items = [];
      if (state is CartLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CartErrorState) {
        return const Center(
          child: Text('ERROR'),
        );
      }

      if (state is CartInitialState) {
        return const Center(
          child: Text('INITIAL ERROR'),
        );
      }

      if (state is CartLoadedState) {
        items = state.loadedData as List<CartEntity>;
        List<BasketEntity> listBasket = items[0].basket;
        return Scaffold(
            backgroundColor: Color(0xFFE5E5E5),
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        children: [
                          const Text(
                            'Add address',
                            style: TextStyle(
                                color: Color(0xFF010035),
                                fontFamily: 'Mark Pro',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF6E4E),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.add_location,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  child: const Text(
                    'My Cart',
                    style: TextStyle(
                        color: Color(0xFF010035),
                        fontFamily: 'Mark Pro',
                        fontWeight: FontWeight.w700,
                        fontSize: 32),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Container(
                              child: ListView.builder(
                                  itemCount: listBasket.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: Image.network(
                                              listBasket[index].image,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listBasket[index].title,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Mark Pro',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 22),
                                                  ),
                                                  Text(
                                                    '\$' +
                                                        listBasket[index]
                                                            .price
                                                            .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFF6E4E),
                                                        fontFamily: 'Mark Pro',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 22),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF282843),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Mark Pro',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Mark Pro',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  '+',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Mark Pro',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.delete,
                                            color: Color(0xFF36364D),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Mark Pro',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              Text(
                                '\$' + items[0].total.toString() + ' us',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Mark Pro',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Delivery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Mark Pro',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              Text(
                                items[0].delivery,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Mark Pro',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40, top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize:
                                    Size(SizeConfig.screenWidth! * 0.8, 50),
                                primary: Color(0xFFFF6E4E)),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Color(0xFF010035)),
                  ),
                )
              ],
            )));
      }
      return const Center(
        child: Text('ERROR BLOC'),
      );
    });
  }
}
