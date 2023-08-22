import 'package:flutter/material.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final Color? buttonColor;
  final Color? titleColor;

  const AppButton(
    this.title, {
    this.buttonColor,
    this.onTap,
    this.prefix,
    this.suffix,
    this.titleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              return onTap != null
                  ? (buttonColor ?? AppColors.primaryColor)
                  : AppColors.primaryColor.withOpacity(.3);
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefix != null) prefix!,
              Text(
                title,
                style: TextStyle(color: titleColor ?? Colors.white),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ));
  }
}
