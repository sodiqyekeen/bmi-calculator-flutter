import 'package:flutter/material.dart';
import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/app_constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.label, this.onPressed});
  final String label;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kAppSecondaryColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
            child: Text(
          label,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
