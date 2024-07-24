import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mitt_shop/firebase_options.dart';
import 'package:mitt_shop/views/checkout_page.dart';
import 'bindings/product_binding.dart';
import 'controllers/auth_controller.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';

import 'views/register_page.dart';
import 'views/search_page.dart';
import 'views/cart_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: ProductBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<AuthController>(() => AuthController());
          }),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<AuthController>(() => AuthController());
          }),
        ),
        GetPage(
          name: '/search',
          page: () => SearchPage(),
        ),
        GetPage(
          name: '/cart',
          page: () => CartPage(),
        ),
        GetPage(
          name: '/checkout',
          page: () => CheckoutPage(),
        ),
      ],
    );
  }
}
