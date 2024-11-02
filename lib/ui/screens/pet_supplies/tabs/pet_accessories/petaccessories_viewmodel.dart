import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class PetaccessoriesViewmodel extends BaseViewModel {
  onTap(String name, String url, String size, String desc, String benefits,
      num price, bool isAccessory) {
    navigationService.navigateTo(Routes.suppliesDetailsView,
        arguments: SuppliesDetailsViewArguments(
            isAccessory: isAccessory,
            name: name,
            desc: desc,
            size: size,
            url: url,
            benefits: benefits,
            price: price));
  }
}
