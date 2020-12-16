import 'package:flutter/material.dart';

class CircleShape extends StatelessWidget {
  final Color color;
  final double width, height;

  CircleShape(
      {@required this.color, @required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      width: width,
      height: height,
    );
  }
}
