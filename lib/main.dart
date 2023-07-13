import 'package:ecommerces/screens/blog/blog_detail.dart';
import 'package:ecommerces/screens/blog/blog_screen.dart';
import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/screens/checkout/checkout.dart';
import 'package:ecommerces/screens/forgot_password/enter_new_password.dart';
import 'package:ecommerces/screens/forgot_password/enter_otp_code.dart';
import 'package:ecommerces/screens/forgot_password/forgot_password.dart';
import 'package:ecommerces/screens/home_screen.dart';
import 'package:ecommerces/screens/login/login_screen.dart';
import 'package:ecommerces/screens/product_detail/product_detail.dart';
import 'package:ecommerces/screens/register/enter_info.dart';
import 'package:ecommerces/screens/register/enter_otp_code_register.dart';
import 'package:ecommerces/screens/register/register_screen.dart';
import 'package:ecommerces/screens/review/review_product.dart';
import 'package:ecommerces/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'model/product.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 1), () {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Product()),
      ],
      child: GetMaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgot_password': (context) => const ForgotPassword(),
          '/enter_code': (context) => const OtpScreen(),
          '/create_new_password': (context) => const EnterNewPassword(),
          '/enter_code_register': (context) => const OtpScreenRegister(),
          '/enter_info': (context) => const EnterInfo(),
          '/blogs': (context) => const BlogScreen(),
          '/blog_detail': (context) => const BlogDetails(),
          '/product_detail': (context) => const ProductDetail(),
          '/review_product': (context) => const ReviewProductScreen(),
          '/cart': (context) => const CartScreen(),
          '/search': (context) => const SearchScreen(),
          '/checkout': (context) => const CheckoutScreen(),
        },
      ),
    );
  }
}
