// import 'package:cart_app/module/models/cart_item.dart';
// import 'package:cart_app/module/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class CartService extends ChangeNotifier {
//   late Box<CartItem> _cartBox;

//   List<CartItem> _cartItems = [];
//   List<CartItem> get cartItems => _cartItems;

//   double get totalPrice => _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

//   Future<void> init() async {
//     // Open the cart box
//     _cartBox = await Hive.openBox<CartItem>('cart');

//     // Load cart items from Hive
//     _cartItems = _cartBox.values.toList();
//     notifyListeners();
//   }

//   // Add product to the cart
//   Future<void> addToCart(Product product) async {
//     final existingItemIndex = _cartItems.indexWhere((item) => item.id == product.id);
//     if (existingItemIndex != -1) {
//       _cartItems[existingItemIndex].quantity += 1;
//       await _cartBox.putAt(existingItemIndex, _cartItems[existingItemIndex]);
//     } else {
//       final newItem = CartItem(
//         id: product.id,
//         name: product.name,
//         price: product.price,
//         quantity: 1,
//       );
//       _cartItems.add(newItem);
//       await _cartBox.add(newItem);
//     }
//     notifyListeners();
//   }

//   // Remove product from the cart
//   Future<void> removeFromCart(int productId) async {
//     _cartItems.removeWhere((item) => item.id == productId);
//     await _cartBox.deleteWhere((item) => item.id == productId);
//     notifyListeners();
//   }

//   // Update product quantity
//   Future<void> updateQuantity(int productId, int quantity) async {
//     final index = _cartItems.indexWhere((item) => item.id == productId);
//     if (index != -1) {
//       _cartItems[index].quantity = quantity;
//       await _cartBox.putAt(index, _cartItems[index]);
//     }
//     notifyListeners();
//   }
// }
