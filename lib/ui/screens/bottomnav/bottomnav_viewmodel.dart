import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/home_screen/home_view.dart';
import 'package:admin_project/ui/screens/newly_added_pets/newlyadded_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomnavViewmodel extends BaseViewModel {
  int selectedIndex = 0;
  final List<Widget> screens = [
    HomeView(),
    NewlyaddedView(),
    Container(
      color: Palette.cream,
    ),
  ];
  bottomNavOnTap(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
