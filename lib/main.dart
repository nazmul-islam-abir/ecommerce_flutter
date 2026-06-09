import 'package:ecommerce/screens/Products_Info.dart';
import 'package:ecommerce/screens/Products2_info.dart';
import 'package:ecommerce/screens/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
