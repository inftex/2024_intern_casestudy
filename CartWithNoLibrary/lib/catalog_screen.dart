import 'package:flutter/material.dart';
import 'product.dart';
import 'theme.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Product> products = [
    Product(name: 'Product 1', price: 29.99, color: Colors.red),
    Product(name: 'Product 2', price: 49.99, color: Colors.blue),
    Product(name: 'Product 3', price: 19, color: Colors.green),
    Product(name: 'Product 4', price: 24, color: Colors.yellow),
    Product(name: 'Product 5', price: 5.99, color: Colors.purple),
    Product(name: 'Product 6', price: 19.99, color: Colors.orange),
    Product(name: 'Product 7', price: 29.99, color: Colors.black),
    Product(name: 'Product 8', price: 49.99, color: Colors.pink),
    Product(name: 'Product 9', price: 19, color: Colors.brown),
    Product(name: 'Product 10', price: 24, color: Colors.grey),
    Product(name: 'Product 11', price: 5.99, color: Colors.lightGreen),
    Product(name: 'Product 12', price: 19.99, color: Colors.deepPurple),
  ];
  List<Product> cart = [];

  void _addToCart(Product product) {
    setState(() {
      if (!cart.contains(product)) {
        cart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepYellow,
        title: const Text(
          'Catalog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart', arguments: cart);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final isInCart = cart.contains(product);
          return ListTile(
            title: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: product.color,
                ),
                const SizedBox(width: 10),
                Text('${product.name} - \$${product.price.toStringAsFixed(2)}'),
              ],
            ),
            trailing: isInCart
                ? const Icon(Icons.check, color: Colors.green)
                : TextButton(
                    onPressed: () => _addToCart(product),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('ADD'),
                  ),
          );
        },
      ),
    );
  }
}
