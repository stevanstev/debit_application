import 'package:flutter/material.dart';

Widget debitDefaultButton({
  @required Color buttonColor,
  @required Color splashColor,
  @required double height,
  @required String label,
  @required Color labelColor,
  @required Function onTap,
  double elevation = 0,
  double labelSize = 14,
  double top = 0,
  double width,
  FontWeight labelWeight = FontWeight.normal,
}) {
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

GestureDetector debitClickableWidget({Widget child, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: child,
  );
}
