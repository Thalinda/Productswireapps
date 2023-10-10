// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}

class Product {
  String id;
  String sku;
  String name;
  String brandName;
  String mainImage;
  Price price;
  List<String> sizes;
  String stockStatus;
  String colour;
  String description;

  Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.price,
    required this.sizes,
    required this.stockStatus,
    required this.colour,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["SKU"],
        name: json["name"],
        brandName: json["brandName"],
        mainImage: json["mainImage"],
        price: Price.fromJson(json["price"]),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        stockStatus: json["stockStatus"],
        colour: json["colour"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "SKU": sku,
        "name": name,
        "brandName": brandName,
        "mainImage": mainImage,
        "price": price.toJson(),
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "stockStatus": stockStatus,
        "colour": colour,
        "description": description,
      };
}

class Price {
  String amount;
  String currency;

  Price({
    required this.amount,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
      };
}
