import 'package:hive/hive.dart';
import '../models/cart_item.dart';

class Database {
  static const String cartBoxName = 'cart';

  static Future<void> saveCart(List<CartItem> cartItems) async {
    final box = await Hive.openBox<CartItem>(cartBoxName);
    box.clear();
    for (var item in cartItems) {
      box.add(item);
    }
  }

  static Future<List<CartItem>> loadCart() async {
    final box = await Hive.openBox<CartItem>(cartBoxName);
    return box.values.toList();
  }
}
