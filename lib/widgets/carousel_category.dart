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
        name: 'Đồ uống',
        icon: Icon(Icons.emoji_food_beverage_outlined),
        color: 0xFF3A9B7A,
      ),
      const Category(
        id: 2,
        name: 'Thức ăn nhanh',
        icon: Icon(Icons.fastfood_outlined),
        color: 0xFFFE6E4C,
      ),
      const Category(
        id: 3,
        name: 'Pizza',
        icon: Icon(Icons.local_pizza),
        color: 0xFFFFC120,
      ),
      const Category(
        id: 4,
        name: 'Thời trang nữ',
        icon: Icon(Icons.shopping_bag),
        color: 0xFF9B81E5,
      ),
      const Category(
        id: 5,
        name: 'Thời trang nam',
        icon: Icon(Icons.shopping_bag),
        color: 0xFFD3A984,
      ),
      const Category(
        id: 6,
        name: 'Thời trang trẻ em',
        icon: Icon(Icons.shopping_bag),
        color: 0xFFD3A984,
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
