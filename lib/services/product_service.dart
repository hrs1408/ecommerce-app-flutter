import 'package:http/http.dart' as http;

class ProductService {
  var client = http.Client();
  var url = 'http://127.0.0.1:8000/api/products';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse(url),
    );
    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response = await client.get(Uri.parse("$url/$id"));
    return response;
  }
}
