import 'package:cart_app/module/models/cart_item.dart';
import 'package:cart_app/module/providers/cart_provider.dart';
import 'package:cart_app/module/providers/product_provider.dart';
import 'package:cart_app/module/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the products when the screen is first loaded
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          // Show a loading spinner if products are empty
          if (productProvider.products.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          // Display the list of products
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return ListTile(
                leading: Image.network(product.thumbnail),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    final cartItem = CartItem(
                      id: product.id,
                      name: product.title,
                      price: product.price,
                    );
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(cartItem);
                              Navigator.pushNamed(context, '/cart');
                  },
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                ),
              );
            },
          );
        },  
      ),
    );
  }
}
