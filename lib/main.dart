import 'package:burger_shop/controller/burger_controller.dart';
import 'package:burger_shop/view/cart_view.dart';
import 'package:burger_shop/view/details_view.dart';
import 'package:burger_shop/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BurgerController(),
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
      initialRoute: '/',
      routes: {
        '/': (_) => HomeView(),
        '/details': (_) => DetailsView(),
        '/cart': (_) => CartView(),
      },
    );
  }
}
