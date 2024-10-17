import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'catalog_screen.dart';
import 'cart_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/catalog': (context) => CatalogScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
