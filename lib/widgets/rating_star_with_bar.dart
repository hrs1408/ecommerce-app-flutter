import 'package:flutter/material.dart';

class RatingStarBar extends StatelessWidget {
  final int rating;

  const RatingStarBar({super.key, required this.rating});

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
        Container(
          width: 100,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const LinearProgressIndicator(
            value: 0.8,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFC120)),
          ),
        ),
      ],
    );
  }
}
