import 'package:bloc_kullanimi1/models/cart.dart';

class CartService {
  //1
  CartService._internal();
  //2
  static final CartService _singleton = CartService._internal();
  //3
  factory CartService() {
    return _singleton;
  }

  //değişkenler
  static List<Cart> cartItems = [];

  //methodlar
  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
