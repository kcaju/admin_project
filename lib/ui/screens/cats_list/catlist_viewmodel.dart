import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class CatlistViewmodel extends BaseViewModel {
  //detailscrn
  onTap(Map<String, dynamic> catDetails) {
    navigationService.navigateTo(Routes.petdetailsView,
        arguments: PetdetailsViewArguments(
            name: catDetails['name'],
            color: catDetails['color'],
            phone: catDetails['phone'],
            owner: catDetails['owner'],
            desc: catDetails['desc'],
            sex: catDetails['sex'],
            location: catDetails['location'],
            url: catDetails['url'],
            price: catDetails['price'],
            age: catDetails['age']));
  }

  goBack() {
    navigationService.back();
  }
}
