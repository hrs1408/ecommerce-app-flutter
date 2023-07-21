import 'package:ecommerces/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';

class CarouselProduct extends StatelessWidget {
  const CarouselProduct({super.key});

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 258,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Obx(() {
          if (controller.isProductLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: controller.productList
                .map((e) => ProductItem(
              product: e,
            ))
                .toList(),
          );
        }),
      )
    );
  }
}
