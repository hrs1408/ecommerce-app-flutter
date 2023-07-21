import 'dart:convert';

import 'package:ecommerces/model/product.dart';

List<CartItem> cartItemListFromJson(String val) => List<CartItem>.from(
    json.decode(val)["data"]["cart_items"].map((val) => CartItem.cartItemFromJson(val)));

class CartItem {
  final int id;
  final int cartId;
  final int productId;
  final int quantity;
  final Product product;

  CartItem(
      {required this.id,
      required this.cartId,
      required this.productId,
      required this.quantity,
      required this.product});

  factory CartItem.cartItemFromJson(Map<String, dynamic> data) => CartItem(
        id: data['id'],
        cartId: data['cart_id'],
        productId: data['product_id'],
        quantity: data['quantity'],
        product: Product.productFromJson(data['product']),
      );
}
