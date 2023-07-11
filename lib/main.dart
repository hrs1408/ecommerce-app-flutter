import 'package:ecommerces/screens/forgot_pasword/enter_new_password.dart';
import 'package:ecommerces/screens/forgot_pasword/enter_otp_code.dart';
import 'package:ecommerces/screens/forgot_pasword/forgot_password.dart';
import 'package:ecommerces/screens/home_screen.dart';
import 'package:ecommerces/screens/login_screen.dart';
import 'package:ecommerces/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Product()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/forgot_password': (context) => const ForgotPassword(),
            '/enter_code': (context) => const OtpScreen(),
            '/create_new_password': (context) => const EnterNewPassword(),
          },
        ));
  }
}
