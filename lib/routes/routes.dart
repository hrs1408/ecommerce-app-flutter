import 'package:ecommerces/screens/blog/blog_detail.dart';
import 'package:ecommerces/screens/blog/blog_screen.dart';
import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/screens/checkout/checkout.dart';
import 'package:ecommerces/screens/checkout/checkout_step_two.dart';
import 'package:ecommerces/screens/checkout/order_success.dart';
import 'package:ecommerces/screens/forgot_password/enter_new_password.dart';
import 'package:ecommerces/screens/forgot_password/enter_otp_code.dart';
import 'package:ecommerces/screens/home_screen.dart';
import 'package:ecommerces/screens/login/login_screen.dart';
import 'package:ecommerces/screens/product_detail/product_detail.dart';
import 'package:ecommerces/screens/profile/profile.dart';
import 'package:ecommerces/screens/register/enter_info.dart';
import 'package:ecommerces/screens/register/enter_otp_code_register.dart';
import 'package:ecommerces/screens/register/register_screen.dart';
import 'package:ecommerces/screens/review/review_product.dart';
import 'package:ecommerces/screens/search/search.dart';
import 'package:get/route_manager.dart';

import '../screens/forgot_password/forgot_password.dart';

class Routes {
  static const INITIAL = '/home';

  static final routes = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: '/forgot_password',
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: '/enter_code',
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: '/create_new_password',
      page: () => const EnterNewPassword(),
    ),
    GetPage(
      name: '/enter_code_register',
      page: () => const OtpScreenRegister(),
    ),
    GetPage(
      name: '/enter_info',
      page: () => const EnterInfo(),
    ),
    GetPage(
      name: '/blogs',
      page: () => const BlogScreen(),
    ),
    GetPage(
      name: '/blog_detail',
      page: () => const BlogDetails(),
    ),
    // GetPage(
    //   name: '/product_detail',
    //   page: () => const ProductDetail(),
    // ),
    GetPage(
      name: '/review_product',
      page: () => const ReviewProductScreen(),
    ),
    GetPage(
      name: '/cart',
      page: () => const CartScreen(),
    ),
    GetPage(
      name: '/search',
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: '/checkout',
      page: () => const CheckoutScreen(),
    ),
    GetPage(
      name: '/checkout_step_two',
      page: () => const CheckoutStepTwoScreen(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: '/order_success',
      page: () => const OrderSuccessScreen(),
    ),
  ];
}
