import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wireapps/controller/itemscontroller.dart';
import 'package:wireapps/models/products.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<CarController>(context, listen: false).fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final carController = Provider.of<CarController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        actions: [
          IconButton(
            icon: Stack(
              children: <Widget>[
                const Icon(Icons.shopping_cart),
                if (carController.items.isNotEmpty)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        carController.items.length.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
              itemCount: carController.products.length,
              itemBuilder: (context, index) {
                final product = carController.products[index];
                return ListTile(
                  leading: Image.network(
                    product.mainImage,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      );
                    },
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    '${double.parse(product.price.amount).toStringAsFixed(2)} ${product.price.currency}',
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/product_details',
                      arguments: product,
                    );
                  },
                  trailing: Consumer<CarController>(
                    builder: (context, cart, child) {
                      return IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          cart.addToCart(product);
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
