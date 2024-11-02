import 'package:stacked/stacked.dart';

class OrderedItemsViewmodel extends BaseViewModel {
  List<String> selectStatus = ["Order Placed", 'Out for delivery', 'Delivered'];
  String? status;
}
