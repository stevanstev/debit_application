import 'package:flutter/material.dart';

Widget defaultButton(
    {double width,
    Color buttonColor,
    Color splashColor,
    double height,
    String label,
    double labelSize = 14,
    double top = 0,
    Color labelColor,
    double elevation = 0,
    FontWeight labelWeight = FontWeight.normal,
    Function onTap}) {
  return Container(
    margin: EdgeInsets.only(top: top),
    width: width,
    height: height,
    child: Material(
      borderRadius: BorderRadius.circular(5),
      elevation: elevation,
      color: buttonColor,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: labelColor,
                fontSize: labelSize,
                fontWeight: labelWeight),
          ),
        ),
      ),
    ),
  );
}

GestureDetector clickableWidget({Widget child, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: child,
  );
}
