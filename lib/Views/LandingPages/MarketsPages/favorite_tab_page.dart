import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class FavoriteTabPage extends StatefulWidget {
  const FavoriteTabPage({super.key});

  @override
  State<FavoriteTabPage> createState() => _FavoriteTabPageState();
}

class _FavoriteTabPageState extends State<FavoriteTabPage> {
  String initValue = "Spot";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Row(
                children: ["Spot", "Future"]
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          initValue = e;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: e == initValue ? Colors.grey.withOpacity(.3) : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(e, style: Theme.of(context).textTheme.bodySmall)
                              .paddingSymmetric(horizontal: 10, vertical: 2.5),
                        ).paddingSymmetric(horizontal: 2.5),
                      ),
                    )
                    .toList(),
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  const Icon(
                    Icons.add_chart,
                    size: 15,
                  ),
                  const Icon(
                    Icons.edit_calendar_outlined,
                    size: 15,
                  ),
                ]
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(.3)),
                        child: e.paddingAll(5),
                      ).paddingOnly(right: 10),
                    )
                    .toList(),
              )
            ],
          ).paddingOnly(bottom: 20),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              CurrencyValesModel(
                  "ET", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "BTC", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "ETH", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "LTC", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "SOL", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "XRP", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "ARB", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
              CurrencyValesModel(
                  "AVAX", "/", "USDT", Icon(Icons.check, color: AppColors.primaryColor)),
            ]
                .map((e) => Container(
                      width: MediaQuery.of(context).size.width * .45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: Colors.grey.withOpacity(.3)),
                      child: Row(
                        children: [
                          Text(e.cryptoCurrency, style: Theme.of(context).textTheme.headlineMedium),
                          Text(e.separator,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: AppColors.greyText)),
                          Text(
                            e.toCurrency,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.greyText),
                          ),
                          const Expanded(child: SizedBox()),
                          e.trailing,
                        ],
                      ).paddingSymmetric(horizontal: 10, vertical: 10),
                    ).paddingSymmetric(vertical: 5, horizontal: 5))
                .toList(),
          ).paddingOnly(bottom: 20),
          AppButton(
            "Add Favourite",
            onTap: () {},
          )
        ],
      ).paddingAll(10),
    );
  }
}

class CurrencyValesModel {
  final String cryptoCurrency;
  final String separator;
  final String toCurrency;
  final Widget trailing;

  CurrencyValesModel(this.cryptoCurrency, this.separator, this.toCurrency, this.trailing);
}
