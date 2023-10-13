import 'package:flutter/material.dart';

// create a view for bottom navigation bar
class BottomNavigationMode {
  List<BottomNavigationBarItem> items = [];

  BottomNavigationMode() {
    items = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.app_registration_rounded),
        label: "Search",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.post_add_outlined),
        label: "Publish",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.motorcycle_outlined),
        label: "Rides",
      ),
    ];
  }
}
