import 'package:bloc_kullanimi1/screens/cart_screen.dart';
import 'package:bloc_kullanimi1/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const ProductListScreen(),
        "/cart": (context) => const CartScreen(),
      },
      initialRoute: "/",
    );
  }
}
