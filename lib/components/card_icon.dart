import 'package:flutter/material.dart';
import 'package:bmi_calculator/app_constants.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
