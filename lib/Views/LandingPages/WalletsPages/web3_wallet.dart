// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Views/AuthPages/auth_page.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';

import '../../../string_and_consts.dart';

class Web3WalletPage extends StatelessWidget {
  const Web3WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImageRes.web3Wallet,
            color: AppColors.primaryColor,
          ),
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
              // walletProvider.connectWallet();
              // walletProvider.launchMetaMask();
              walletProvider.getKey();
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
