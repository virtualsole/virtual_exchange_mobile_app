import 'package:flutter/material.dart';
import 'dart:math' as math;

extension WidgetExtension on Widget {
  Widget topFlip() => Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: this,
      );
}
