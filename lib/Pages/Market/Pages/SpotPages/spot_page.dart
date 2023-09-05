import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Pages/Market/Pages/SpotPages/usdt_page.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/app_theme.dart';

class SpotPage extends StatefulWidget {
  const SpotPage({super.key});

  @override
  State<StatefulWidget> createState() => _SpotPageState();
}

class _SpotPageState extends State<SpotPage> {
  ScrollController controller = ScrollController();
  List<String> currencyList = [
    "USDT",
    "FDUSD",
    "TUSD",
    "BUSD",
    "BNB",
    "BGTC",
    "ALTS",
    "FIAT",
  ];

  String initValue = "USDT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            "Add Favourite",
            onTap: () {},
          ).paddingAll(10),
          TextButton(
              onPressed: () {},
              child: Text(
                "Add Another Pair",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff27313C).withOpacity(.5),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: currencyList
                    .map((e) => GestureDetector(
                          onTap: () {
                            int indexOf = currencyList.indexOf(e);

                            if (indexOf == 4) {
                              controller.animateTo(
                                controller.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.bounceIn,
                              );
                            } else if (indexOf == 2) {
                              controller.animateTo(
                                controller.position.minScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.bounceIn,
                              );
                            }

                            setState(() {
                              initValue = e;
                            });
                          },
                          child: Container(
                            decoration: e == initValue
                                ? BoxDecoration(color: Colors.grey.withOpacity(.3))
                                : null,
                            child: Text(e,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w700))
                                .paddingSymmetric(vertical: 3, horizontal: 10),
                          ).paddingSymmetric(horizontal: 5),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: UsdtPages())
          ],
        ),
      ).paddingOnly(top: 30),
    );
  }
}
