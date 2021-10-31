import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;

  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You\'re a bit heavy right now. Eat less, and exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You\'re got yourself a great BMI, you sexy devil.';
    } else {
      return 'You\'re a bit underweight, you gotta eat more.';
    }
  }
}
