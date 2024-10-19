import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class DoglistViewmodel extends BaseViewModel {
  //detailsscreen navigtn
  onTap(Map<String, dynamic> dogDetails) {
    navigationService.navigateTo(Routes.petdetailsView,
        arguments: PetdetailsViewArguments(
            name: dogDetails['name'],
            color: dogDetails['color'],
            owner: dogDetails['owner'],
            desc: dogDetails['desc'],
            sex: dogDetails['sex'],
            location: dogDetails['location'],
            url: dogDetails['url'],
            price: dogDetails['price'],
            age: dogDetails['age']));
  }

  goBack() {
    navigationService.back();
  }
}
