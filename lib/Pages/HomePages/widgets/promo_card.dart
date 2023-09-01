import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/extensions.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration().boxRadius(5, Colors.grey.shade900.withOpacity(.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration().boxRadius(2.5, Colors.black26),
            child: Text(
              "10D : 05H : 21M : 03S",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
            ).paddingSymmetric(vertical: 2, horizontal: 5),
          ).paddingOnly(top: 20, bottom: 10, left: 20),
          Text(
            "Deposit 10 USDT to get 30 USDT Trade Fee Rebate !",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).paddingOnly(top: 20, bottom: 10, left: 20),
          Row(
            children: [
              Container(
                width: 100,
                height: 5,
                decoration: const BoxDecoration().boxRadius(100, Colors.black12),
              ),
              const SizedBox(width: 10),
              Text(
                "0/10 USDT",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Expanded(child: SizedBox.shrink()),
              AppButton(
                "Deposit",
                onTap: () {},
              ),
            ],
          ).paddingOnly(top: 20, bottom: 10, left: 20, right: 20),
        ],
      ),
    );
  }
}
