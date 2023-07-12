import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;

  const RatingStar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < rating; i++)
          const Icon(
            Icons.star,
            color: Color(0XFFFFC120),
            size: 16,
          ),
        for (var i = 0; i < 5 - rating; i++)
          const Icon(
            Icons.star_outline,
            size: 16,
          ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
