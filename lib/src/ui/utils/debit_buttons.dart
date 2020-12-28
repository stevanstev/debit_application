import 'package:debit/src/blocs/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget debitDefaultButton({
  @required Color splashColor,
  @required double height,
  @required String label,
  @required Color labelColor,
  @required Function onTap,
  double elevation = 0,
  double labelSize = 14,
  double top = 0,
  double width,
  Color buttonColor,
  double buttonRadius = 10,
  FontWeight labelWeight = FontWeight.normal,
}) {
  return BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, themeState) => Container(
      margin: EdgeInsets.only(top: top),
      width: width,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(buttonRadius),
        elevation: elevation,
        color: buttonColor ?? themeState.props[0],
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
    ),
  );
}

Widget debitIconButton({
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
  double buttonRadius = 4,
  FontWeight labelWeight = FontWeight.normal,
  IconData icon,
  Color iconColor,
}) {
  return Container(
    margin: EdgeInsets.only(top: top),
    width: width,
    height: height,
    child: Material(
      borderRadius: BorderRadius.circular(buttonRadius),
      elevation: elevation,
      color: buttonColor,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 19,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: TextStyle(
                  color: labelColor,
                  fontSize: labelSize,
                  fontWeight: labelWeight),
            ),
          ],
        )),
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

GestureDetector debitButtonWithIcon({
  @required onTap,
  @required IconData icon,
  @required Color color,
  @required String buttonText,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          buttonText,
          style: TextStyle(color: color),
        ),
      ],
    ),
  );
}
