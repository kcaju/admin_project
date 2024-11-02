import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/constants/assets.gen.dart';
import 'package:admin_project/ui/screens/pet_supplies/petsupply_viewmodel.dart';
import 'package:admin_project/ui/screens/pet_supplies/tabs/pet_accessories/petaccessories_view.dart';
import 'package:admin_project/ui/screens/pet_supplies/tabs/pet_food/petfood_view.dart';
import 'package:admin_project/ui/screens/pet_supplies/tabs/pet_medicine/petmedicine_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PetsupplyView extends StatelessWidget {
  const PetsupplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PetsupplyViewmodel>.reactive(
      viewModelBuilder: () {
        return PetsupplyViewmodel();
      },
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Palette.first,
              leading: Icon(null),
              centerTitle: true,
              title: Text(
                "Get the best Pet supplies",
                style: TextStyle(
                    color: Palette.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TabBar(
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    labelColor: Palette.black,
                    unselectedLabelColor: Palette.grey,
                    tabs: [
                      Tab(
                        text: "Foods",
                        icon: Assets.images.foods.image(height: 50),
                      ),
                      Tab(
                        text: "Medicines",
                        icon: Assets.images.medicines.image(height: 50),
                      ),
                      Tab(
                        text: "Accessories",
                        icon: Assets.images.cage.image(height: 50),
                      ),
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  PetfoodView(),
                  PetmedicineView(),
                  PetaccessoriesView()
                ]))
              ],
            ),
          ),
        );
      },
    );
  }
}
