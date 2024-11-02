import 'package:admin_project/ui/screens/birds_list/birdlist_view.dart';
import 'package:admin_project/ui/screens/bottomnav/bottomnav_view.dart';
import 'package:admin_project/ui/screens/cats_list/catlist_view.dart';
import 'package:admin_project/ui/screens/dogs_list/doglist_view.dart';
import 'package:admin_project/ui/screens/pet_details/petdetails_view.dart';
import 'package:admin_project/ui/screens/supplies_detail_screen/supplies_details_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_service.dart';
import '../ui/screens/splash/splash_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: BottomnavView),
    MaterialRoute(page: DoglistView),
    MaterialRoute(page: CatlistView),
    MaterialRoute(page: BirdlistView),
    MaterialRoute(page: PetdetailsView),
    MaterialRoute(page: SuppliesDetailsView),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {}
