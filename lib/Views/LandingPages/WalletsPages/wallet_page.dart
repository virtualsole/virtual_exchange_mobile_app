import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Views/LandingPages/WalletsPages/web3_wallet.dart';

import 'super_wallet.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String initValue = "Web3 Wallet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: ["Web3 Wallet", "Super Wallet"]
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      initValue = e;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: initValue == e ? Theme.of(context).primaryColorLight : null,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                      child: Text(
                        e,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(
                              fontWeight: initValue == e ? FontWeight.bold : null,
                            ),
                      ).paddingAll(10),
                    ),
                  ),
                )
                .toList(),
          ).paddingAll(20),
          Expanded(
            child: initValue == "Web3 Wallet" ? const Web3WalletPage() : const SuperWalletPage(),
          )
        ],
      ),
    );
  }
}
