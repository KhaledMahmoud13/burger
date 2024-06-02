import 'package:burger_shop/fake_data(burger).dart';
import 'package:burger_shop/model/burger.dart';
import 'package:flutter/material.dart';

class BurgerController extends ChangeNotifier {
  List<Burger> burgerList =
      fakeData['data']!.map((e) => Burger.fromJson(e)).toList();

  List<Burger> cartList = [];

  List<String> categories = [
    'Burger',
    'Pizza',
    'Cheese',
    'Pasta',
  ];

  int selectedCategory = 0;

  double opacity = 0.0;

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  changeOpacity() {
    opacity = 1.0;
    notifyListeners();
  }

  void addToCart(Burger item) {
    if (cartList.any((element) => element == item)) {
      return;
    }
    cartList.add(item);
    notifyListeners();
  }

  void removeFromCart(Burger item) {
    cartList.remove(item);
    notifyListeners();
  }

  void increaseQuantityOfItem(Burger item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantityOfItem(Burger item) {
    if (item.quantity == 1) {
      return;
    }
    item.quantity--;
    notifyListeners();
  }
}
