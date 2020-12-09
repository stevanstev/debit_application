import 'package:flutter/material.dart';

class NotImplementedUI extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  NotImplementedUI({this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Placeholder(
        color: color,
      ),
    );
  }
}
