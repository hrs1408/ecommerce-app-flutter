import 'dart:convert';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)["data"].map((val) => Product.productFromJson(val)));

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final int categoryId;
  final List<dynamic> images;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.categoryId,
      required this.images});

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['name'],
        price: data['price'],
        description: data['description'],
        categoryId: data['category_id'],
        images: data['images'],
      );
}
