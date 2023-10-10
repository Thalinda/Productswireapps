import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wireapps/screens/cartScreen.dart';
import 'package:wireapps/screens/productsDetails.dart';
import 'package:wireapps/screens/productsScreen.dart';
import 'controller/itemscontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CarController(),
      child: MaterialApp(
        title: 'Product Catalog',
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/product_details': (context) => ProductDetailsScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
