import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/app/utils.dart';
import 'package:stacked/stacked.dart';

class CatViewmodel extends BaseViewModel {
  List<Map> catBreed = [
    {
      "url": "https://puppiezo.com/wp-content/uploads/2023/06/IMG_2155.jpeg",
      "breed": "British Shorthair"
    },
    {
      "url":
          "https://cdn.shopify.com/s/files/1/0589/8262/9516/t/23/assets/persian-cat-pictures-21hn32h4yempw0cu-1702031742033.jpg?v=1702031743",
      "breed": "Persian cat"
    },
    {
      "url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvcsA1vqWdWDOYm0Xn-47YQXz0ZezvkuravpvJ4QPmYDHbxfUcf4k2lNfc7jxXEkST9CY&usqp=CAU",
      "breed": "Siberian cat"
    },
    {
      "url": "https://www.litter-robot.com/media/wysiwyg/ragdoll-1.png",
      "breed": "Ragdoll"
    },
    {
      "url":
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSUXurtLuqstiO4lPNpUNMWw3cG_EsR4rS-Gkfx2F_pkWi6oyxQ",
      "breed": "American Wirehair"
    },
  ];
  void navigate(Map<String, dynamic> catData, String id, String breed,
      String url, String category) {
    navigationService.navigateTo(Routes.catlistView,
        arguments: CatlistViewArguments(
            category: category,
            catData: catData,
            id: id,
            url: url,
            breed: breed));
  }
}
