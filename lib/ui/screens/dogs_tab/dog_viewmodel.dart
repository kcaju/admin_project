import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class DogViewmodel extends BaseViewModel {
  void navigate(Map<String, dynamic> dogData, String id, String breed,
      String url, String category) {
    navigationService.navigateTo(Routes.doglistView,
        arguments: DoglistViewArguments(
            dogData: dogData,
            id: id,
            url: url,
            breed: breed,
            category: category));
  }
}
