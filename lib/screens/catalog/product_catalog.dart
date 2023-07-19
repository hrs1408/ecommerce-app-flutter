import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/widgets/checkbox_with_label.dart';
import 'package:ecommerces/widgets/product_item.dart';
import 'package:ecommerces/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCatalog extends StatefulWidget {
  final String category;

  const ProductCatalog({super.key, required this.category});

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  RangeValues _currentRangeValues = const RangeValues(18, 60);

  @override
  Widget build(BuildContext context) {
    void showFillerSortingDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, innerSetState) {
              return Dialog(
                child: SizedBox(
                    width: double.infinity,
                    height: 410,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sắp xếp theo',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          ),
                          const Divider(),
                          const Text('Giá'),
                          RangeSlider(
                            values: _currentRangeValues,
                            min: 0,
                            max: 5000000,
                            divisions: 500000,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey[300],
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              innerSetState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Từ ${_currentRangeValues.start.round().toString()} đến ${_currentRangeValues.end.round().toString()}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  child: const Text(
                                    'Áp dụng',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          const Divider(),
                          const CheckBox(label: 'Giảm giá'),
                          const CheckBox(label: 'Miễn phí vận chuyển'),
                          const CheckBox(label: 'Giá tăng dần'),
                          const CheckBox(label: 'Giá giảm dần'),
                        ],
                      ),
                    )),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Text(
                    widget.category != '' ? widget.category : 'Tất cả sản phẩm',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Badge(
                      label: const Text('5'),
                      child: InkWell(
                        onTap: () {
                          Get.to(const CartScreen());
                        },
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: SearchInput(
                  hintText: 'Tìm kiếm...',
                  enabledInput: true,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 227,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 10; i++) const ProductItem(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              showFillerSortingDialog();
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(width: 1, color: Colors.black),
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
            child: const Text('Lọc & Sắp xếp',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
