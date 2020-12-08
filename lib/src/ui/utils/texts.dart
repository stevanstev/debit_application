import 'package:debit/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class TextStyleProps {
  Color color;
  double fontSize;
  FontWeight fontWeight;

  TextStyleProps({this.color, this.fontSize, this.fontWeight});
}

TextStyle _headerStyle(TextStyleProps props) {
  return TextStyle(
      color: props.color,
      fontSize: props.fontSize,
      fontWeight: props.fontWeight);
}

TextStyle simpleStyle({Color color, double fontSize = 15}) {
  return TextStyle(fontSize: fontSize, color: color);
}

Text header(
    {String text,
    BuildContext context,
    int type = 1,
    Color color,
    double fontSize = 15}) {
  TextStyleProps props;

  switch (type) {
    case 1:
      props = TextStyleProps(
          color: color, fontSize: 35, fontWeight: FontWeight.bold);
      break;
    case 2:
      props = TextStyleProps(
          color: color, fontSize: 30, fontWeight: FontWeight.bold);
      break;
    case 3:
      props = TextStyleProps(
          color: color, fontSize: 25, fontWeight: FontWeight.bold);
      break;
    case 4:
      props = TextStyleProps(
          color: color, fontSize: 20, fontWeight: FontWeight.bold);
      break;
    case 5:
      props = TextStyleProps(
          color: color, fontSize: 15, fontWeight: FontWeight.bold);
      break;
    case 6:
      props = TextStyleProps(
          color: color, fontSize: 10, fontWeight: FontWeight.bold);
      break;
    case 7:
      props = TextStyleProps(
          color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
      break;
    default:
      props = TextStyleProps(
          color: color, fontSize: 10, fontWeight: FontWeight.bold);
      break;
  }

  TextStyle style = _headerStyle(props);

  return Text(text, style: style);
}
