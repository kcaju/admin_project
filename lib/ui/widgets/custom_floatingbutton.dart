import 'package:admin_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingbutton extends StatelessWidget {
  const CustomFloatingbutton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Palette.blue2,
      backgroundColor: Palette.grey1,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Add Pets",
          style: TextStyle(
              color: Palette.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    );
  }
}
