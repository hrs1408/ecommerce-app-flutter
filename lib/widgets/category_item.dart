import 'package:ecommerces/model/category.dart';
import 'package:ecommerces/screens/catalog/product_catalog.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProductCatalog(category: category.name)));
      },
      child: SizedBox(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(category.color).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                category.icon.icon,
                color: Color(category.color),
              ),
            ),
            Center(
              child: Text(
                category.name,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
