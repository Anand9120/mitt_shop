import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var quantities = <Product, int>{}.obs;

  void addToCart(Product product) {
    if (quantities.containsKey(product)) {
      quantities[product] = quantities[product]! + 1;
    } else {
      cartItems.add(product);
      quantities[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    if (quantities.containsKey(product) && quantities[product]! > 1) {
      quantities[product] = quantities[product]! - 1;
    } else {
      cartItems.remove(product);
      quantities.remove(product);
    }
  }

  double get totalPrice => cartItems.fold(
    0,
        (sum, item) => sum + (item.price * quantities[item]!),
  );
}
