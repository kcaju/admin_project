import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddSuppliesViewmodel extends BaseViewModel {
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController imgeUrl = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController benefits = TextEditingController();
  //dropdown values
  List<String> selectCategory = ["Petfoods", 'Petmedicines', 'Petssupplies'];
  String? category;
  onChangedCategory(String? value) {
    category = value!;
    notifyListeners();
  }

  void clearForm() {
    price.clear();
    productName.clear();
    size.clear();
    imgeUrl.clear();
    desc.clear();
    benefits.clear();
    category = null;
    notifyListeners();
  }
}
