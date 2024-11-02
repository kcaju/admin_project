import 'package:admin_project/ui/screens/add_supplies/add_supplies_view.dart';
import 'package:admin_project/ui/screens/home_screen/home_view.dart';
import 'package:admin_project/ui/screens/ordered_items/ordered_items_view.dart';
import 'package:admin_project/ui/screens/ordered_pets_list/orderedpets_view.dart';
import 'package:admin_project/ui/screens/pet_supplies/petsupply_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomnavViewmodel extends BaseViewModel {
  int selectedIndex = 0;
  final List<Widget> screens = [
    HomeView(),
    OrderedpetsView(),
    PetsupplyView(),
    AddSuppliesView(),
    OrderedItemsView()
  ];
  bottomNavOnTap(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
