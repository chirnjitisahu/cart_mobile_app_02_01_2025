import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/cart_item.dart';
import '../utils/database.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice =>
      _cartItems.fold(0, (total, item) => total + item.totalPrice);

  int get totalItems => _cartItems.length;

  Future<void> addToCart(CartItem item) async {
    _cartItems.add(item);
    await Database.saveCart(_cartItems);
    notifyListeners();
  }

  Future<void> updateQuantity(String id, int newQuantity) async {
    final cartItem = _cartItems.firstWhere((item) => item.id == id);
    cartItem.quantity = newQuantity;
    await Database.saveCart(_cartItems);
    notifyListeners();
  }

  Future<void> removeFromCart(String id) async {
    _cartItems.removeWhere((item) => item.id == id);
    await Database.saveCart(_cartItems);
    notifyListeners();
  }

  Future<void> fetchCartItems() async {
    _cartItems = await Database.loadCart();
    notifyListeners();
  }
}
