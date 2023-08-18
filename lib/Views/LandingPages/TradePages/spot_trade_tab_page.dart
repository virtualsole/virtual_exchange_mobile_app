import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:virtual_exchange/Views/AuthPages/auth_page.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/Widgets/buy_or_sell_button.dart';
import 'package:virtual_exchange/Widgets/wrap_icon.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class SpotTradingBuyOrSell extends StatefulWidget {
  const SpotTradingBuyOrSell({super.key});

  @override
  State<SpotTradingBuyOrSell> createState() => _SpotTradingBuyOrSellState();
}

class _SpotTradingBuyOrSellState extends State<SpotTradingBuyOrSell> {
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
              ).paddingAll(20),
              const Expanded(child: SizedBox()),
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
                const BuyOrSellButton(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
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
                    color: AppColors.themeColor,
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
                AmountAndTotalSelection((String value) {}).paddingOnly(bottom: 5),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("-"),
                      Text("Amount(ET)", style: Theme.of(context).textTheme.bodySmall),
                      const Text("+"),
                    ],
                  ).paddingAll(10),
                ).paddingSymmetric(vertical: 5),
                const PercentageBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Avbl", style: Theme.of(context).textTheme.bodySmall),
                    Text("-USDT", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                AppButton("Login", onTap: () {
                  Get.to(() => const LoginPage());
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
        color: AppColors.themeColor,
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
