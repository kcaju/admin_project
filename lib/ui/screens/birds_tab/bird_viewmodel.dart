import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class BirdViewmodel extends BaseViewModel {
  List<Map> bireBreed = [
    {
      "url":
          "https://lafeber.com/pet-birds/wp-content/uploads/2018/06/Cockatiel-2.jpg",
      "breed": "Cockatiel"
    },
    {
      "url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZfxANZNHqe3tEiJjJlJ868uS5hGjtZ1C0QWfp0GiQJDu273AcMLuoEH2IcSRUO_kTct0&usqp=CAU",
      "breed": "Macaw"
    },
    {
      "url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL5w_zeQMjb3mKSokZ2r8wfDu78m3kgPGOiuZ8QUWC-PVeQXLAv9cQRqnDBPcgyEetFfc&usqp=CAU",
      "breed": "Love Birds"
    },
    {
      "url":
          "https://static.toiimg.com/thumb/msid-106263492,imgsize-60122,width-900,height-1200,resizemode-6/106263492.jpg",
      "breed": "Parrot"
    },
  ];
  void navigate(Map<String, dynamic> birdData, String id, String breed,
      String url, String category) {
    navigationService.navigateTo(Routes.birdlistView,
        arguments: BirdlistViewArguments(
            category: category,
            birdData: birdData,
            id: id,
            url: url,
            breed: breed));
  }
}
