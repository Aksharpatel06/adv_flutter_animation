import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int animationIndex = 0;
  double width = 150;
  Alignment alignment = Alignment.topLeft;
  Color color = Colors.red;
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  double opacity = 1;
  bool isMoved = false;
  double leftPostioned = 200;
  double topPostioned = 200;

  void changeIndex(int index) {
    animationIndex = index;
    notifyListeners();
  }

  void animatorChange() {
    if (isMoved) {
      width = 200;
      alignment = Alignment.bottomRight;
      color = Colors.redAccent;
      borderRadius = const BorderRadius.all(Radius.circular(20));
      opacity = 0;
      leftPostioned = 50;
      topPostioned = 50;
      isMoved = false;
      notifyListeners();
    } else {
      width = 150;
      alignment = Alignment.topLeft;
      color = Colors.red;
      borderRadius = const BorderRadius.all(Radius.circular(10));
      opacity = 1;
      topPostioned = 200;
      leftPostioned = 200;
      isMoved = true;
      notifyListeners();
    }
    notifyListeners();
  }
}
