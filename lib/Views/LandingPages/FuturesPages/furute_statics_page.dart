// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Views/AuthPages/auth_page.dart';
import 'package:virtual_exchange/Views/LandingPages/FuturesPages/margin_mode.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/app_mode_bottoml_sheet.dart';
import 'package:virtual_exchange/Widgets/buy_or_sell_button.dart';
import 'package:virtual_exchange/Widgets/dropdown_button.dart';
import 'package:virtual_exchange/Widgets/wrap_icon.dart';
import 'package:virtual_exchange/string_and_consts.dart';

import '/Widgets/HomePage/listenable_text.dart';

class FutureStaticsPage extends StatefulWidget {
  const FutureStaticsPage({super.key});

  @override
  State<FutureStaticsPage> createState() => _FutureStaticsPageState();
}

class _FutureStaticsPageState extends State<FutureStaticsPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Funding",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.greyText, fontSize: 10),
                      ),
                      Text(
                        "-0.0011%",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Countdown",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.greyText, fontSize: 10),
                      ),
                      Text(
                        "02:30:30",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(top: 10, left: 5, right: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.greyText),
                      ),
                      Text(
                        "(USDT)",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.greyText),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.greyText),
                      ),
                      Text(
                        "(ET)",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.greyText),
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(top: 10, left: 5, right: 5),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListenableText("34353.0", AppColors.redColor),
                      const ListenableText("3.0K", Colors.white),
                    ],
                  ).paddingOnly(right: 20, left: 10).paddingSymmetric(vertical: 2);
                },
              )),
              Column(
                children: [
                  Text(
                    "259117",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenColor,
                          fontSize: 10,
                        ),
                  ),
                  Text(
                    "259117",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.greyText,
                          fontSize: 10,
                        ),
                  ),
                ],
              ).paddingSymmetric(vertical: 5),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListenableText("34353.0", AppColors.greenColor),
                      const ListenableText("3.0K", Colors.white),
                    ],
                  ).paddingOnly(right: 20, left: 10).paddingSymmetric(vertical: 2);
                },
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WrapIcon(
                    child: SvgPicture.asset(
                      ImageRes.filterIcon,
                      height: 20,
                      color: Colors.white,
                    ),
                  ).paddingOnly(right: 10),
                  WrapIcon(
                    child: SvgPicture.asset(
                      ImageRes.menuIcon,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppDropDownButton(
                      "Cross",
                      onTap: () {
                        appBottomSheet(const MarginMode());
                      },
                    ),
                    const AppDropDownButton("150X"),
                    WrapIcon(
                      child: SvgPicture.asset(
                        ImageRes.plusIcon,
                        color: Colors.white,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: 5),
                const BuyOrSellButton(
                  values: ["Open", "Close"],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.info_outline_rounded, color: Colors.white),
                      Text("Market", style: Theme.of(context).textTheme.bodySmall),
                      const Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ).paddingAll(10),
                ).paddingSymmetric(vertical: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Market", style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ).paddingAll(10),
                ).paddingOnly(bottom: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("-"),
                      Text("Amount(USDT)", style: Theme.of(context).textTheme.bodySmall),
                      const Text("+"),
                    ],
                  ).paddingAll(10),
                ).paddingSymmetric(vertical: 5),
                const PercentageBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Avbl", style: Theme.of(context).textTheme.bodySmall),
                    Text("--", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ).paddingSymmetric(vertical: 2.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    Text("TP/SL", style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
                AppButton("Login", onTap: () {
                  Get.to(() => LoginPage());
                }),
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        ),
      ],
    );
  }
}

class AmountAndTotalSelection extends StatefulWidget {
  final ValueChanged<String> valueChange;

  const AmountAndTotalSelection(this.valueChange, {super.key});

  @override
  State<AmountAndTotalSelection> createState() => _AmountAndTotalSelectionState();
}

class _AmountAndTotalSelectionState extends State<AmountAndTotalSelection> {
  String buttonValue = "amount";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ["Amount", "Sell"]
            .map((e) => Expanded(
                  child: InkWell(
                    onTap: () {
                      buttonValue = e;
                      widget.valueChange(e);
                      setState(() {});
                    },
                    child: Container(
                      color: buttonValue == e ? Colors.grey.withOpacity(.3) : null,
                      child: Center(
                        child: Text(
                          e,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall,
                        ),
                      ).paddingAll(10),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

/// Progress Bar With Percentage

class PercentageBar extends StatefulWidget {
  const PercentageBar({super.key});

  @override
  State<PercentageBar> createState() => _PercentageBarState();
}

class _PercentageBarState extends State<PercentageBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            rotatedContainer(),
            Expanded(child: Container(height: 2, color: Colors.grey.withOpacity(.3))),
            rotatedContainer(),
            Expanded(child: Container(height: 2, color: Colors.grey.withOpacity(.3))),
            rotatedContainer(),
            Expanded(child: Container(height: 2, color: Colors.grey.withOpacity(.3))),
            rotatedContainer(),
          ],
        ),
        Row(
          children: [
            Text("25%", style: Theme.of(context).textTheme.bodySmall),
            const Expanded(child: SizedBox()),
            Text("50%", style: Theme.of(context).textTheme.bodySmall),
            const Expanded(child: SizedBox()),
            Text("75%", style: Theme.of(context).textTheme.bodySmall),
            const Expanded(child: SizedBox()),
            Text("100%", style: Theme.of(context).textTheme.bodySmall),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    ).paddingOnly(top: 5);
  }

  Widget rotatedContainer() {
    return Transform.rotate(
      angle: 40,
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(border: Border.all(width: 1, color: AppColors.primaryColor)),
      ),
    );
  }
}
