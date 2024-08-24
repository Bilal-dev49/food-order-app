import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order/screen/about_page.dart';
import 'package:food_order/screen/cart_page.dart';
import 'package:food_order/screen/home_page.dart';
import 'package:food_order/screen/sign_up.dart';
import 'package:food_order/screen/welcome_page.dart';
import 'package:food_order/screen/login_page.dart';
import 'screen/detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff2b2b2b),
        appBarTheme: AppBarTheme(
          color: Colors.orange,
        ),
      ),
      home: CartPage(),
    );
  }
}
