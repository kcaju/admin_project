import 'package:admin_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingbutton extends StatelessWidget {
  const CustomFloatingbutton({super.key, this.onPressed, required this.pet});
  final VoidCallback? onPressed;
  final String pet;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 98,
      child: FloatingActionButton(
        splashColor: Palette.blue2,
        backgroundColor: Palette.grey1,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Text(
            "Add $pet",
            style: TextStyle(
                color: Palette.white,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
