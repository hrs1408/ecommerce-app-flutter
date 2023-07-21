import 'package:ecommerces/screens/product_detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    void showProductActionDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tùy chọn',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(Icons.close),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(ProductDetail(product: product));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Chi tiết sản phẩm'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.share_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Chia sẻ sản phẩm'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            actions: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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
            titlePadding: const EdgeInsets.all(12),
            contentPadding: const EdgeInsets.all(10),
            actionsPadding: const EdgeInsets.all(10),
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.to(ProductDetail(
                  product: product,
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: product.images.isNotEmpty
                            ? NetworkImage(product.images[0]['file_path'])
                            : const NetworkImage(
                                'https://3qleather.com/wp-content/themes/olympusinn/assets/images/default-placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    NumberFormat.currency(locale: 'vi').format(product.price),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFFFE3A30),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0XFFFFC120), size: 16),
                const Text('4.9'),
                const Spacer(),
                const Text(
                  '86 Đánh giá',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showProductActionDialog();
                  },
                  child: const Icon(Icons.more_vert),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
