import 'package:http/http.dart' as http;

class CartService {
  var client = http.Client();
  var url = 'http://127.0.0.1:8000/api/carts';

  Future<dynamic> getCart(String token) async {
    var response = await client.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> addProductToCart(
      String token, int quantity, int productId) async {
    var response = await client.post(
      Uri.parse("$url/add"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: '{"product_id": $productId, "quantity": $quantity}',
    );
    return response;
  }

  Future<dynamic> deleteItemInCart(String token, int id) async {
    var response = await client.delete(
      Uri.parse("$url/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> updateItemInCart(String token, int id, int quantity) async {
    var response = await client.put(
      Uri.parse("$url/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: '{"quantity": $quantity}',
    );
    return response;
  }
}
