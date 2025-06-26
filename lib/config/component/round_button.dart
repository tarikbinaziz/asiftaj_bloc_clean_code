import 'package:asiftaj_bloc_clean_code/config/color/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: AppColors.buttonColor),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
