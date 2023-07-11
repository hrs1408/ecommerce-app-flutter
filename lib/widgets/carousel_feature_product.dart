import 'package:ecommerces/widgets/product_item.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ProductItem(),
          ProductItem(),
          ProductItem(),
          ProductItem(),
          ProductItem(),
        ],
      ),
    );
  }
}
