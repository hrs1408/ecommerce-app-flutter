import 'package:ecommerces/widgets/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'Details News',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 67,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/blog/blog.jpg',
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Philosophy Tips Merawat Bodi Mobil agar Tidak Terlihat Kusam',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '13 September 2021',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                          'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, '
                          'making it stiffer, lighter and stronger than regular PET speaker units, '
                          'and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.'),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                          'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, '
                          'making it stiffer, lighter and stronger than regular PET speaker units, '
                          'and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.'),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                          'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, '
                          'making it stiffer, lighter and stronger than regular PET speaker units, '
                          'and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.'),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tin mới nhất',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            BlogItem(),
                            BlogItem(),
                            BlogItem(),
                          ],
                        ),
                      ),
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
