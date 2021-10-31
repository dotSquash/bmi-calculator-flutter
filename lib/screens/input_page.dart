import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/gender_card_children.dart';
import '../constants/constants.dart';
import '../components/round_icon_button.dart';
import '../components/custom_bottom_bar.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardChildren(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      genderTextStyle: selectedGender == Gender.male
                          ? kSelectedGenderLabelStyle
                          : kLabelStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCardChildren(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      genderTextStyle: selectedGender == Gender.female
                          ? kSelectedGenderLabelStyle
                          : kLabelStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
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
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Colors.white,
                      activeTrackColor: Colors.tealAccent,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 180.0,
                      // activeColor: Colors.tealAccent,
                      onChanged: (double newValue) {
                        // print(newValue);
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomBottomBar(
            customBottomBarLabel: 'CALCULATE',
            customBottomBarOnPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult())));
            },
          ),
        ],
      ),
    );
  }
}
