import 'package:flutter/material.dart';
import 'product.dart';
import 'theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> cart =
        ModalRoute.of(context)!.settings.arguments as List<Product>;

    double totalPrice = cart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: deepYellow,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 60,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: product.color,
                      ),
                      const SizedBox(width: 10),
                      Text(
                          '${product.name} - \$${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buy'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
