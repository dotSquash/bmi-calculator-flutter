import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomBottomBar extends StatelessWidget {
  final String customBottomBarLabel;
  final Function customBottomBarOnPressed;

  CustomBottomBar(
      {@required this.customBottomBarLabel,
      @required this.customBottomBarOnPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customBottomBarOnPressed,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            customBottomBarLabel,
            style: kBottomBarTextStyle,
          ),
        ),
      ),
    );
  }
}
