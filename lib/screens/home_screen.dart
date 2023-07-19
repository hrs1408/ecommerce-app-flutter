import 'package:ecommerces/model/category.dart';
import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/screens/search/search.dart';
import 'package:ecommerces/widgets/banner_product.dart';
import 'package:ecommerces/widgets/blog_item.dart';
import 'package:ecommerces/widgets/carousel_banner.dart';
import 'package:ecommerces/widgets/carousel_category.dart';
import 'package:ecommerces/widgets/category_item.dart';
import 'package:ecommerces/widgets/product_feature.dart';
import 'package:ecommerces/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'blog/blog_screen.dart';
import 'login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Category> categories = [
      const Category(
        id: 1,
        name: 'Tai nghe',
        icon: Icon(Icons.headphones_outlined),
        color: 0xFF3A9B7A,
      ),
      const Category(
        id: 2,
        name: 'Tay cầm chơi game',
        icon: Icon(Icons.videogame_asset_outlined),
        color: 0xFFFE6E4C,
      ),
      const Category(
        id: 3,
        name: 'Màn hình',
        icon: Icon(Icons.screenshot_monitor_outlined),
        color: 0xFFFFC120,
      ),
      const Category(
        id: 4,
        name: 'Bàn phím',
        icon: Icon(Icons.keyboard_alt_outlined),
        color: 0xFF9B81E5,
      ),
      const Category(
        id: 5,
        name: 'Laptop',
        icon: Icon(Icons.computer_outlined),
        color: 0xFFD3A984,
      ),
      const Category(
        id: 6,
        name: 'Lưu trữ',
        icon: Icon(Icons.sd_card_outlined),
        color: 0XFFac02db,
      ),
    ];
    void showAuthDialog() {
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
                        Get.back();
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
                    Get.to(const LoginScreen());
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

    void showCategoriesDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tất cả danh mục',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: () {
                        Get.back();
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
            content: SizedBox(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: categories
                    .map(
                      (category) => CategoryItem(
                        category: category,
                      ),
                    )
                    .toList(),
              ),
            ),
            titlePadding: const EdgeInsets.all(12),
            contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
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
                        'Gaming.',
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
                          Badge(
                            label: const Text('5'),
                            child: InkWell(
                              onTap: () {
                                Get.to(const CartScreen());
                              },
                              child: const Icon(Icons.shopping_cart_outlined),
                            ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            Get.to(SearchScreen());
                          },
                          child: const SearchInput(
                            hintText: 'Tìm kiếm...',
                            enabledInput: false,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const CarouselHome(),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                const Text('Danh mục',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    showCategoriesDialog();
                                  },
                                  child: const Text('Xem tất cả',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0XFF3669C9),
                                          fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                          ),
                          const CarouselCategories()
                        ],
                      ),
                    ),
                    const ProductFeature(
                      title: 'Sản phẩm nổi bật',
                    ),
                    const BannerProduct(
                        title:
                            'Bluetooth Headset With Noise Cancelling Microphone',
                        image: 'assets/images/products/headset.png',
                        buttonText: 'Mua ngay',
                        bgColor: 0XFF0ACF83),
                    const ProductFeature(
                      title: 'Sản phẩm bán chạy',
                    ),
                    const BannerProduct(
                        title:
                            'Card màn hình MSI GeForce RTX 3060 Ti GAMING X TRIO 8GB GDDR6',
                        image: 'assets/images/products/video_card.png',
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tin mới nhất',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            for (int i = 0; i < 3; i++) const BlogItem(),
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
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(const BlogScreen());
                          },
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
              showAuthDialog();
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
