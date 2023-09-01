import 'package:flutter/cupertino.dart';

extension BoxRadius on BoxDecoration {
  BoxDecoration boxRadius(double radius, Color? color) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius));
  }
}
