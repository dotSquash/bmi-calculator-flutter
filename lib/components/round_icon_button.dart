import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function customButtonPress;
  final IconData customButtonIcon;

  RoundIconButton(
      {@required this.customButtonPress, @required this.customButtonIcon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Colors.tealAccent,
      onPressed: customButtonPress,
      child: Icon(
        customButtonIcon,
        color: Colors.black,
      ),
    );
  }
}
