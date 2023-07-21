import 'package:ecommerces/services/cart_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_item.dart';

class CartController extends GetxController {
  RxList<CartItem> cartList = List<CartItem>.empty(growable: true).obs;
  RxBool isCartLoading = false.obs;
  RxDouble total = 0.0.obs;
  RxInt itemCount = 0.obs;

  @override
  void onInit() {
    getProductOnCart();
    super.onInit();
  }

  void getProductOnCart() async {
    try {
      isCartLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token") ?? "";
      var result = await CartService().getCart(token);
      if (result != null) {
        cartList.assignAll(cartItemListFromJson(result.body));
        total.value = cartList.fold(
            0,
            (previousValue, element) =>
                previousValue + element.quantity * element.product.price);
        itemCount.value = cartList.fold(
            0, (previousValue, element) => previousValue + element.quantity);
      }
    } finally {
      isCartLoading(false);
    }
  }

  void addProductToCart({required int productId, required int quantity}) async {
    try {
      isCartLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token") ?? "";
      var result =
          await CartService().addProductToCart(token, productId, quantity);
      if (result != null) {
        getProductOnCart();
      }
    } finally {
      isCartLoading(false);
    }
  }

  void deleteProductInCart(int id) async {
    try {
      isCartLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token") ?? "";
      var result = await CartService().deleteItemInCart(token, id);
      if (result != null) {
        getProductOnCart();
      }
    } finally {
      isCartLoading(false);
    }
  }

  void updateCartItem(int id, int quantity) async {
    try {
      isCartLoading(true);
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token") ?? "";
      var result = await CartService().updateItemInCart(token, id, quantity);
      if (result != null) {
        getProductOnCart();
      }
    } finally {
      isCartLoading(false);
    }
  }
}
