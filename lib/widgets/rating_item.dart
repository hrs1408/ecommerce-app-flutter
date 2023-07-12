import 'package:ecommerces/widgets/rating_star.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nguyễn Văn An',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(
                    '2 ngày trước',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              RatingStar(
                rating: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Keripik Pisang Dahlia adalah keripik pisang yang dibuat dengan bahan-bahan berkualitas dan diproses dengan higienis. Keripik pisang ini memiliki rasa yang renyah dan gurih. Keripik pisang ini cocok untuk dijadikan oleh-oleh karena memiliki kemasan yang menarik dan praktis.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Divider(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
