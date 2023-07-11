import 'package:ecommerces/widgets/banner_product.dart';
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
                          hintText: 'Search...',
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
                                Text('Categories',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                Spacer(),
                                Text('See All',
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
                    const ProductFeature(),
                    const BannerProduct(title: 'Keripik Pisang Premium',image: 'assets/images/banner/product_banner.png',buttonText: 'Belanja Sekarang', bgColor: 0XFF0ACF83),
                    const ProductFeature(),
                    const BannerProduct(title: '[Promo] Beras 5 Kg',image: 'assets/images/banner/product_banner_two.png',buttonText: 'Shop now', bgColor: 0XFF3669C9),
                    const ProductFeature(),
                    const ProductFeature(),
                    const ProductFeature(),
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
              Navigator.pushNamed(context, '/login');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.double_arrow),
            label: 'Jasa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'ORDER',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'LOGIN',
          ),
        ],
      ),
    );
  }
}
