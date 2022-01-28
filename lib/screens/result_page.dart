import 'package:bmi_calculator/components/app_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: AppCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: kResultTextColour,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
