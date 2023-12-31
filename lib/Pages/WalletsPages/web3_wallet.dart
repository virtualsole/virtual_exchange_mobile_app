// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/pages/AuthPages/auth_page.dart';

class Web3WalletPage extends StatelessWidget {
  const Web3WalletPage({super.key});

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
          Text(
            "Web3 Wallet",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium,
          ),
          Text(
            "Web3 Cryptocurrency Exchange",
            style: Theme.of(
              context,
            ).textTheme.bodySmall,
          ).paddingOnly(bottom: 50),
          AppButton(
            "Connect Wallet",
            onTap: () {
              walletProvider.launchMetaMask();
            },
          ).paddingOnly(bottom: 30),
          TextButton(
            onPressed: () {
              Get.to(() => LoginPage());
            },
            child: Text(
              "Login Now",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
