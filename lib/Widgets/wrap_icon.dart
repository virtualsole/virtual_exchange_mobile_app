import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapIcon extends StatelessWidget {
  final Widget? child;
  const WrapIcon({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: child?.paddingAll(5),
    );
  }
}
