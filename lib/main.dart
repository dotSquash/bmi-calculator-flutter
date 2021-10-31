import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_screen.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          // primaryColor: Colors.black54,
          // accentColor: Colors.purpleAccent,
          scaffoldBackgroundColor: Colors.black54,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.black),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
          '/results': (context) => ResultsScreen(),
        });
  }
}
