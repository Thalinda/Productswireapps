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
                return Dismissible(
                  key: UniqueKey(), // Unique key for each item
                  onDismissed: (direction) {
                    // Handle item removal here
                    cart.removeFromCart(
                        item); // Assuming you have a method for removing items in your controller
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                  ),
                  child: ListTile(
                    title: Text(item.product.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                  ),
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
