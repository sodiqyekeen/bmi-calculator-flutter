import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/app_constants.dart';
import 'package:bmi_calculator/components/app_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/card_icon.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                AppCard(
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: CardIcon(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
                AppCard(
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: CardIcon(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ],
            ),
          ),
          AppCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBoldLabelStyle,
                      ),
                      Text(
                        'CM',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kActiveSliderColour,
                        inactiveTrackColor: kInactiveSliderColour,
                        thumbColor: kSliderThumbColour,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: kSliderThumbColour.withAlpha(0x29)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Row(
              children: [
                AppCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBoldLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                AppCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onPressed: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
