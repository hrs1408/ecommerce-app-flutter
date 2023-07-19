import 'package:ecommerces/widgets/product_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/search_input.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Positioned(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Tìm kiếm',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 68,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SearchInput(
                              hintText: 'Tìm kiếm...',
                              enabledInput: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 230,
                              child: const Column(
                                children: [],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const ProductFeature(title: 'Sản phẩm nổi bật'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
