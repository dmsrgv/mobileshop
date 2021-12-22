import 'package:sqflite/sqflite.dart';

import 'package:mobileshop/core/db/database_consts.dart';
import 'package:mobileshop/features/cart/data/models/cart_model.dart';

abstract class CartLocalDataSource {
  Future<CartModel> readCart();
  void insertCart(CartModel cart);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  Database db;
  CartLocalDataSourceImpl({
    required this.db,
  });

  @override
  void insertCart(CartModel cart) async {
    await db.insert(cartTable,
        {cartID: 1900, cartTotal: cart.total, cartDelivery: cart.delivery},
        conflictAlgorithm: ConflictAlgorithm.replace);

    // for (var basketItem in cart.basket) {
    //   await db.insert(
    //       cartBasketTable,
    //       {
    //         cartBasketID: 7000 + cart.basket.indexOf(basketItem),
    //         cartBasketTitle: basketItem.title,
    //         cartBasketImage: basketItem.image,
    //         cartBasketPrice: basketItem.price
    //       },
    //       conflictAlgorithm: ConflictAlgorithm.replace);
    // }

    for (var basketItem in cart.basket) {
      await db.insert(cartBasketTable, basketItem.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  @override
  Future<CartModel> readCart() async {
    List<BasketModel> basket = [];
    var basketMaps = await db.query(cartBasketTable);

    for (var basketItem in basketMaps) {
      basket.add(BasketModel(
          title: basketItem[cartBasketTitle],
          image: basketItem[cartBasketImage],
          price: basketItem[cartBasketPrice]));
    }

    var cartMaps = await db.query(cartTable);
    return CartModel(
        id: cartMaps[0][cartID],
        basket: basket,
        total: cartMaps[0][cartTotal],
        delivery: cartMaps[0][cartDelivery]);
  }
}
