import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AppProgressBar extends StatefulWidget {
  const AppProgressBar({super.key});

  @override
  State<AppProgressBar> createState() => _AppProgressBarState();
}

class _AppProgressBarState extends State<AppProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            Text("Gainers: 36"),
            Expanded(child: SizedBox.shrink()),
            Text("Losers: 335"),
          ],
        ).paddingOnly(left: 10, right: 10, bottom: 5),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                // width: MediaQuery.of(context).size.width,
                height: 15,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2.5),
                    bottomLeft: Radius.circular(2.5),
                  ),
                ),
              ).paddingOnly(left: 10, right: 10),
            )
          ],
        ),
      ],
    );
  }
}
