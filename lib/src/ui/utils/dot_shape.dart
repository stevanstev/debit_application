import 'package:flutter/material.dart';

class DotShape extends StatelessWidget {
  final double opacity;

  DotShape({this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Color.fromRGBO(0, 0, 0, opacity)),
    );
  }
}
