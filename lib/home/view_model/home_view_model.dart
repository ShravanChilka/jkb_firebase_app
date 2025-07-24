import 'package:flutter/material.dart';

enum HomeNavigationDestination { home, search, profile }

class HomeViewModel extends ChangeNotifier {
  HomeNavigationDestination destination = HomeNavigationDestination.home;

  int get selectedDestinationIndex {
    return destination.index;
  }

  void onDestinationChangeEvent(int index) {
    destination = HomeNavigationDestination.values[index];
    notifyListeners();
  }
}
