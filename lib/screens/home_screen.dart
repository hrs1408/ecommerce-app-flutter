import 'package:ecommerces/widgets/banner_product.dart';
import 'package:ecommerces/widgets/blog_item.dart';
import 'package:ecommerces/widgets/carousel_banner.dart';
import 'package:ecommerces/widgets/carousel_category.dart';
import 'package:ecommerces/widgets/product_feature.dart';
import 'package:ecommerces/widgets/search_input.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void showMaterialDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Thông báo',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: const Icon(Icons.close),
                    )
                  ],
                ),
                const Divider()
              ],
            ),
            content: const SizedBox(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/hand.png'),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Bạn cần đăng nhập trước',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Vui lòng đăng nhập/đăng ký trước để thực hiện giao dịch',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF3669C9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Đăng nhập',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
            titlePadding: const EdgeInsets.all(12),
            contentPadding: const EdgeInsets.all(10),
            actionsPadding: const EdgeInsets.all(10),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        'DUMBES',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0XFF3669C9),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child:
                                const Icon(Icons.notifications_none_outlined),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: const Icon(Icons.shopping_cart_outlined),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 73 - 56,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: SearchInput(
                          hintText: 'Tìm kiếm...',
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const CarouselHome(),
                    ),
                    Container(
                      color: Colors.white,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                Text('Danh mục',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                Spacer(),
                                Text('Xem tất cả',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0XFF3669C9),
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          CarouselCategories()
                        ],
                      ),
                    ),
                    const ProductFeature(
                      title: 'Sản phẩm nổi bật',
                    ),
                    const BannerProduct(
                        title: 'Khoai tây chiên cao cấp',
                        image: 'assets/images/banner/product_banner.png',
                        buttonText: 'Mua ngay',
                        bgColor: 0XFF0ACF83),
                    const ProductFeature(
                      title: 'Sản phẩm bán chạy',
                    ),
                    const BannerProduct(
                        title: '[Khuyến Mãi] Gạo 5 Kg',
                        image: 'assets/images/banner/product_banner_two.png',
                        buttonText: 'Mua ngay',
                        bgColor: 0XFF3669C9),
                    const ProductFeature(
                      title: 'Sản phẩm mới',
                    ),
                    const ProductFeature(
                      title: 'Sản phẩm hàng đầu',
                    ),
                    const ProductFeature(
                      title: 'Sản phẩm giảm giá',
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Column(
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
                            Divider(),
                            BlogItem(),
                            Divider(),
                            BlogItem(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, // thickness
                                      color: Colors.black // color
                                      ),
                                  // border radius
                                  borderRadius: BorderRadius.circular(16))),
                          child: const Text(
                            'Đọc thêm',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0XFF3669C9),
        unselectedItemColor: const Color(0XFF0C1A30),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/jasa');
              break;
            case 2:
              Navigator.pushNamed(context, '/order');
              break;
            case 3:
              // Navigator.pushNamed(context, '/login');
              showMaterialDialog();
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'TRANG CHỦ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.double_arrow),
            label: 'JASA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'ĐƠN HÀNG',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'TÀI KHOẢN',
          ),
        ],
      ),
    );
  }
}
