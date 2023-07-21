import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerces/controller/cart_controller.dart';
import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/screens/review/review_product.dart';
import 'package:ecommerces/widgets/product_feature.dart';
import 'package:ecommerces/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  RxInt quantity = 1.obs;
  CartController controller = Get.put(CartController());

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thêm vào giỏ hàng thành công'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  void showAddToCardDialog(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Thêm vào giỏ hàng',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.close),
              )
            ],
          ),
          content: SizedBox(
            height: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Số lượng: '),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (quantity > 1) {
                              quantity--;
                            }
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Color(0XFF3669C9),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                          ),
                          child: Center(
                            child: Obx(() => Text(quantity.toString())),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            quantity++;
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0XFF3669C9),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  controller.addProductToCart(
                    productId: id,
                    quantity: quantity.value,
                  );
                  Get.back();
                  showSuccessDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF3669C9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Thêm vào giỏ hàng',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
          titlePadding: const EdgeInsets.all(20),
          actionsPadding: const EdgeInsets.all(20),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Text('Chi tiết sản phẩm',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.share)),
                        Badge(
                          label: const Text('5'),
                          child: InkWell(
                            onTap: () {
                              Get.to(const CartScreen());
                            },
                            child: const Icon(Icons.shopping_cart_outlined),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 167,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              disableCenter: true,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              height: 250,
                            ),
                            items: widget.product.images.isNotEmpty
                                ? widget.product.images
                                    .map((item) => Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: Image(
                                            image:
                                                NetworkImage(item['file_path']),
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ))
                                    .toList()
                                : [
                                    Image.network(
                                      'https://3qleather.com/wp-content/themes/olympusinn/assets/images/default-placeholder.png',
                                      fit: BoxFit.cover,
                                    )
                                  ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi')
                                .format(widget.product.price),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0XFFFE3A30),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Color(0XFFFFC120), size: 16),
                                  Text('4.9'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '86 Đánh giá',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0XFF3A9B7A).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text('Tồn kho: 250',
                                    style: TextStyle(
                                      color: Color(0XFF3A9B7A),
                                    )),
                              )
                            ],
                          ),
                          const Divider(
                            height: 50,
                          ),
                          const Text('Mô tả sản phẩm',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(widget.product.description),
                          const Divider(
                            height: 50,
                          ),
                          // ignore: prefer_const_constructors
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Đánh giá (86)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Color(0XFFFFC120), size: 18),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('4.9',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          for (int i = 0; i < 3; i++) const RatingItem(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(const ReviewProductScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, // thickness
                                            color: Colors.black // color
                                            ),
                                        // border radius
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                child: const Text(
                                  'Đọc thêm',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ProductFeature(title: 'Có thể bạn cũng thích')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ElevatedButton(
                onPressed: () {
                  showAddToCardDialog(widget.product.id);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF3669C9),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text(
                  'Thêm vào giỏ hàng',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
