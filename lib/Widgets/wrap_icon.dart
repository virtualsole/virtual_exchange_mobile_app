import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class WrapIcon extends StatelessWidget {
  final Widget? child;
  const WrapIcon({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: child?.paddingAll(5),
    );
  }
}
