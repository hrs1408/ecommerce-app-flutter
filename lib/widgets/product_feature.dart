import 'package:ecommerces/widgets/carousel_feature_product.dart';
import 'package:flutter/material.dart';

class ProductFeature extends StatelessWidget {
  const ProductFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text('Feature Products',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Spacer(),
                      Text('See All',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF3669C9),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        CarouselProduct()
      ],
    );
  }
}
