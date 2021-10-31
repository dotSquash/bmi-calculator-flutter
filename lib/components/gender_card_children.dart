import 'package:flutter/material.dart';

class GenderCardChildren extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextStyle genderTextStyle;

  GenderCardChildren({this.icon, this.label, this.genderTextStyle});

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
          style: genderTextStyle,
        )
      ],
    );
  }
}
