import 'package:flutter/widgets.dart';

double fullWidthSize({BuildContext context}) {
  return MediaQuery.of(context).size.width;
}

double fullHeightSize({BuildContext context}) {
  return MediaQuery.of(context).size.height;
}
