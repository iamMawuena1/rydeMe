import 'package:flutter/material.dart';

class RiderBottoNavBarProvider extends ChangeNotifier {
  int currentTab = 0;

  updateTab(int newTab) {
    currentTab = newTab;
    notifyListeners();
  }
}
