import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/constants/assets.gen.dart';
import 'package:admin_project/ui/screens/bottomnav/bottomnav_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomnavView extends StatelessWidget {
  const BottomnavView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomnavViewmodel>.reactive(
      viewModelBuilder: () {
        return BottomnavViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: viewModel.screens[viewModel.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                viewModel.bottomNavOnTap(value);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Palette.first,
              selectedItemColor: Palette.black,
              unselectedLabelStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              selectedLabelStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              unselectedItemColor: Palette.grey,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              currentIndex: viewModel.selectedIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Assets.images.home.image(height: 35), label: "Home"),
                BottomNavigationBarItem(
                    icon: Assets.images.cart.image(height: 35),
                    label: "Ordered Pets"),
                // BottomNavigationBarItem(
                //     icon: Icon(
                //       Icons.sms,
                //     ),
                //     label: "chat"),
                // BottomNavigationBarItem(
                //     icon: Icon(
                //       Icons.note_add,
                //       size: 30,
                //     ),
                //     label: "Add Pets"),
                BottomNavigationBarItem(
                    icon: Assets.images.petscart.image(height: 35),
                    label: "Pet Suppplies"),
                BottomNavigationBarItem(
                    icon: Assets.images.petfoods.image(height: 35),
                    label: "Add Supplies"),
                BottomNavigationBarItem(
                    icon: Assets.images.orders.image(height: 35),
                    label: "Ordered Items"),
              ]),
        );
      },
    );
  }
}
