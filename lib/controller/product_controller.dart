import 'package:ecommerces/services/product_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/product.dart';

class ProductController extends GetxController {
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;
  Rx<Product> product = Product(
    id: 0,
    name: '',
    description: '',
    price: 0,
    images: [],
    categoryId: 0,
  ).obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      var result = await ProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }

  void getProductById(int id) async {
    try {
      isProductLoading(true);
      var result = await ProductService().getById(id: id);
      if (result != null) {
        product(Product.productFromJson(result.body));
      }
      print('---------------------');
      print(result.body);
      print('---------------------');
    } finally {
      isProductLoading(false);
    }
  }
}
