import 'package:flutter/material.dart';

class VerticalLinePainter extends CustomPainter {
  final Color color;

  VerticalLinePainter({
    @required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    paint.strokeWidth = 2;

    canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
