import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class HomeViewmodel extends BaseViewModel {
  toDetails(Map<String, dynamic> petDetails) {
    navigationService.navigateTo(Routes.petdetailsView,
        arguments: PetdetailsViewArguments(
            name: petDetails['name'],
            color: petDetails['color'],
            owner: petDetails['owner'],
            phone: petDetails['phone'],
            desc: petDetails['desc'],
            sex: petDetails['sex'],
            location: petDetails['location'],
            url: petDetails['url'],
            price: petDetails['price'],
            age: petDetails['age']));
  }
}
