import 'package:ecommerces/widgets/carousel_feature_product.dart';
import 'package:flutter/material.dart';

class ProductFeature extends StatelessWidget {
  final String title;

  const ProductFeature({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: const Text('See All',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0XFF3669C9),
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const CarouselProduct()
      ],
    );
  }
}
