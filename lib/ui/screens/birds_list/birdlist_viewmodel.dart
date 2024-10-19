import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class BirdlistViewmodel extends BaseViewModel {
  //detlnscrn
  onTap(Map<String, dynamic> birdDetails) {
    navigationService.navigateTo(Routes.petdetailsView,
        arguments: PetdetailsViewArguments(
            name: birdDetails['name'],
            color: birdDetails['color'],
            owner: birdDetails['owner'],
            desc: birdDetails['desc'],
            sex: birdDetails['sex'],
            location: birdDetails['location'],
            url: birdDetails['url'],
            price: birdDetails['price'],
            age: birdDetails['age']));
  }

  goBack() {
    navigationService.back();
  }
}
