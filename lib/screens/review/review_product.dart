import 'package:ecommerces/widgets/rating_item.dart';
import 'package:ecommerces/widgets/rating_star_with_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewProductScreen extends StatelessWidget {
  const ReviewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Text('Review Product',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const Positioned(
                    right: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0XFFFFC120),
                          size: 16,
                        ),
                        Text('4.9',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 68,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: '4.9',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' /',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      TextSpan(
                                          text: '5',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('86 Reviews',
                                    style: TextStyle(fontSize: 16))
                              ],
                            ),
                            const VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            const Column(
                              children: [
                                RatingStarBar(rating: 5),
                                RatingStarBar(rating: 4),
                                RatingStarBar(rating: 3),
                                RatingStarBar(rating: 2),
                                RatingStarBar(rating: 1),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const RatingItem(),
                      const RatingItem(),
                      const RatingItem(),
                      const RatingItem(),
                      const RatingItem(),
                      const RatingItem(),
                      const RatingItem(),
                      const RatingItem(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
