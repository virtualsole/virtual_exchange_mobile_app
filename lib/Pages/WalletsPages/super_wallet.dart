import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/pages/AuthPages/auth_page.dart';

class SuperWalletPage extends StatelessWidget {
  const SuperWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wallet,
            color: AppColors.primaryColor,
            size: 60,
          ),
          Text(
            "Super Wallet",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium,
          ),
          Text(
            "Be in charge of your private keys",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
          Text(
            "manage multiple currencies with a set of",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
          Text(
            "mnemonics",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ).paddingOnly(bottom: 50),
          AppButton(
            "Create Super Wallet",
            onTap: () {},
          ),
          Row(
            children: [
              Text(
                "Already have an super wallet?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                child: Text(
                  "Import wallet",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
