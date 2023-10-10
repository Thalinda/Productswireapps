import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/itemscontroller.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CarController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.product.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                );
              },
            ),
          ),
          Text('Total: £${cart.total.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
