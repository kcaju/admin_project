import 'package:admin_project/constants/app_colors.dart';
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
              unselectedLabelStyle: TextStyle(fontSize: 14),
              selectedLabelStyle: TextStyle(fontSize: 14),
              unselectedItemColor: Palette.grey,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              currentIndex: viewModel.selectedIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    label: "Home"),
                // BottomNavigationBarItem(
                //     icon: Icon(
                //       Icons.favorite,
                //       size: 30,
                //     ),
                //     label: "Favourites"),
                // BottomNavigationBarItem(
                //     icon: Icon(
                //       Icons.sms,
                //     ),
                //     label: "chat"),

                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.note_add,
                      size: 30,
                    ),
                    label: "Add Pets"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.local_pharmacy,
                      size: 30,
                    ),
                    label: "Add Supplies"),
              ]),
        );
      },
    );
  }
}
