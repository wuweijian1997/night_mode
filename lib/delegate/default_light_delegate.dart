import 'dart:ui';
import 'package:flutter/material.dart';
import 'index.dart';

class DefaultLightDelegate extends LightDelegate {
  final double radius;

  const DefaultLightDelegate({this.radius = 100});

  @override
  void paint(Canvas canvas, Offset touchOffset, Size size) {
    if (touchOffset != null) {
      Rect rect = Rect.fromCircle(center: touchOffset, radius: radius / 2);
      Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..shader = RadialGradient(
          radius: 1,
          colors: [
            Colors.white,
            Colors.white.withOpacity(.8),
            Colors.transparent,
          ],
        ).createShader(rect);
      canvas.drawCircle(touchOffset, radius, paint);
    }
  }
}
