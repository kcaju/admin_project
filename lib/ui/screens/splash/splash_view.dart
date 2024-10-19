import 'package:admin_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onViewModelReady: (model) => model.startTimer(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Palette.first,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.pets,
                size: 150,
                color: Palette.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Pet Haus",
                style: TextStyle(
                    color: Palette.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
