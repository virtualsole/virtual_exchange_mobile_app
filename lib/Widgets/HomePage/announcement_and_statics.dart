import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Widgets/chart.dart';
import 'package:virtual_exchange/Widgets/common.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AnnouncementAndStatics extends StatelessWidget {
  const AnnouncementAndStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon(Icons.mic),
              SizedBox(
                height: 20,
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Announcement on the reward distributions of \$10,00.',
                        textStyle: Theme.of(context).textTheme.bodySmall),
                    RotateAnimatedText('Announcement on the lorum impus...',
                        textStyle: Theme.of(context).textTheme.bodySmall),
                  ],
                  repeatForever: true,
                ).paddingOnly(left: 10),
              ),
              const Icon(Icons.menu),
            ],
          ).paddingOnly(right: 10),
          divider.paddingSymmetric(vertical: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 125, width: 125, child: LineChartWidget()),
              SizedBox(
                  height: 125,
                  width: 125,
                  child: LineChartWidget(
                    bgColor: Colors.red,
                    chartColor: Colors.red,
                  )),
              SizedBox(
                height: 125,
                width: 125,
                child: LineChartWidget(
                  bgColor: Colors.red,
                  chartColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
