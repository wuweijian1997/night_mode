import 'package:flutter/material.dart';

abstract class LightDelegate {
  const LightDelegate();

  void paint(Canvas canvas, Offset touchOffset, Size size);
}
