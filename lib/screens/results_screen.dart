import 'package:bmi_calculator/components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants/constants.dart';

class ResultsScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsScreen(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold
                  // color: Colors.tealAccent,
                  // fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 70),
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Color(0xff24d876),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 100.0,
                        color: Colors.tealAccent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomBottomBar(
              customBottomBarLabel: 'RE-CALCULATE YOUR BMI',
              customBottomBarOnPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
