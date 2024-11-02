import 'package:stacked/stacked.dart';

class OrderedpetsViewmodel extends BaseViewModel {
  List<String> selectStatus = ["Order placed", 'Out for delivery', 'Delivered'];
  String? status;
  // onChnaged(String? value) {
  //   status = value!;
  //   notifyListeners();
  // }
}
