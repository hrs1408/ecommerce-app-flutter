import 'package:ecommerces/model/category.dart';
import 'package:ecommerces/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CarouselCategories extends StatelessWidget {
  const CarouselCategories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [
      const Category(
        id: 1,
        name: 'Tai nghe',
        icon: Icon(Icons.headphones_outlined),
        color: 0xFF3A9B7A,
      ),
      const Category(
        id: 2,
        name: 'Tay cầm chơi game',
        icon: Icon(Icons.videogame_asset_outlined),
        color: 0xFFFE6E4C,
      ),
      const Category(
        id: 3,
        name: 'Màn hình',
        icon: Icon(Icons.screenshot_monitor_outlined),
        color: 0xFFFFC120,
      ),
      const Category(
        id: 4,
        name: 'Bàn phím',
        icon: Icon(Icons.keyboard_alt_outlined),
        color: 0xFF9B81E5,
      ),
      const Category(
        id: 5,
        name: 'Laptop',
        icon: Icon(Icons.computer_outlined),
        color: 0xFFD3A984,
      ),
      const Category(
        id: 6,
        name: 'Lưu trữ',
        icon: Icon(Icons.sd_card_outlined),
        color: 0XFFac02db,
      ),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories
            .map(
              (category) => CategoryItem(
                category: category,
              ),
            )
            .toList(),
      ),
    );
  }
}
