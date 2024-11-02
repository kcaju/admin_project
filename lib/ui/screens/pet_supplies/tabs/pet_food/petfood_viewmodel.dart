import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class PetfoodViewmodel extends BaseViewModel {
  //detailsccrn
  onTap(String name, String url, String size, String desc, String benefits,
      num price, bool isAccessory) {
    navigationService.navigateTo(Routes.suppliesDetailsView,
        arguments: SuppliesDetailsViewArguments(
            name: name,
            desc: desc,
            size: size,
            url: url,
            benefits: benefits,
            price: price));
  }
}
