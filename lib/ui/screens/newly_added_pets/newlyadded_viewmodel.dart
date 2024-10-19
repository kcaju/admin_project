import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewlyaddedViewmodel extends BaseViewModel {
  TextEditingController petname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController url = TextEditingController();
  final formkey = GlobalKey<FormState>();
  //dropdown values
  List<String> selectCategory = ["Dog", 'Cat', 'Bird'];
  List<String> selectSex = ["male", 'female'];
  List<String> selectBreed = [
    "Siberian-Husky",
    'Rottweiler',
    'Golden-Retriever',
    'Beagle',
    'St.Bernard',
    'British-Shorthair',
    'Persian-Cat',
    'Siberian-Cat',
    'Ragdoll',
    'Macaw',
    'Cockatiel',
    'Love-Birds',
    'Dove'
  ];

  String? petCategory;
  String? chooseBreed;

  String? chooseSex;

  onChangedCategory(String? value) {
    petCategory = value!;
    notifyListeners();
  }

  onChangedBreed(String? value) {
    chooseBreed = value!;
    notifyListeners();
  }

  onChangedSex(String? value) {
    chooseSex = value!;
    notifyListeners();
  }

  void clearForm() {
    petname.clear();
    ownername.clear();
    price.clear();
    color.clear();
    age.clear();
    url.clear();
    location.clear();
    desc.clear();
    petCategory = null; // Assuming these are the default values
    chooseBreed = null;
    chooseSex = null;
    notifyListeners(); // Notify UI to refresh
  }
}
