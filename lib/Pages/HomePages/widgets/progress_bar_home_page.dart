import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/app_theme.dart';

class ProgressBarHomePage extends StatelessWidget {
  const ProgressBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Verification",
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            Text("Deposit",
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            Text("Trade",
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            buildProcessIndicator(const Icon(Icons.check, color: Colors.black)),
            Expanded(child: Container(height: 5, color: AppColors.primaryColor)),
            buildProcessIndicator(Center(
              child: Text(
                "2",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(child: Container(height: 5, color: AppColors.primaryColor)),
            buildProcessIndicator(Center(
              child: Text(
                "3",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget buildProcessIndicator(Widget child) {
    return Stack(
      children: [
        Container(
            constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            child: child),
      ],
    );
  }
}
