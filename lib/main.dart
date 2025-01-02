import 'package:cart_app/module/models/cart_item.dart';
import 'package:cart_app/module/providers/cart_provider.dart';
import 'package:cart_app/module/providers/product_provider.dart';
import 'package:cart_app/module/screens/cart_screen.dart';
import 'package:cart_app/module/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Cart Management System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) =>  ProductListScreen(),
          '/cart': (context) =>  CartScreen(),
        },
      ),
    );
  }
}
