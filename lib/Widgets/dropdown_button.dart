import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AppDropDownButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const AppDropDownButton(this.title, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.themeColor,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                  ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ).paddingSymmetric(vertical: 5, horizontal: 7.5),
      ),
    );
  }
}
