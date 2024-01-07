import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/models/shop.dart';
import 'package:mini_ecommerce_application/pages/about_us.dart';
import 'package:mini_ecommerce_application/pages/cart_page.dart';
import 'package:mini_ecommerce_application/pages/intro_page.dart';
import 'package:mini_ecommerce_application/pages/login_page.dart';
import 'package:mini_ecommerce_application/pages/profile_page.dart';
import 'package:mini_ecommerce_application/pages/shop_page.dart';
import 'package:mini_ecommerce_application/pages/checkout_page.dart';
import 'package:mini_ecommerce_application/pages/signup_page.dart';
import 'package:mini_ecommerce_application/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/login_page': (context) => LoginPage(),
        '/signup_page': (context) => const SignupPage(),
        '/shop_page': (context) => const ShopPage(),
        '/about_us': (context) => const AboutPage(),
        '/cart_page': (context) => const CartPage(),
        '/checkout_page': (context) => CheckoutPage(),
        '/profile_page': (context) => const ProfilePage(),
      },
    );
  }
}
