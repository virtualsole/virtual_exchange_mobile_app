import 'dart:io';

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_exchange/string_and_consts.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

import 'dart:math';

class WalletProvider extends ChangeNotifier {
  WalletConnect? walletConnect;
  String privateKey = 'a2fd51b96dc55aeb14b30d55a6b3121c7b9c599500c1beb92a389c3377adc86e';

  void getKey() {
    Credentials fromHex = EthPrivateKey.fromHex(privateKey);
    final rng = Random.secure();

    Credentials random = EthPrivateKey.createRandom(rng);

    var address = fromHex.address;
    logger.i(random.address);
    logger.i(address);
  }

  void connectWallet() async {}

  void launchMetaMask() async {
    bool? res = await LaunchApp.isAppInstalled(
        androidPackageName: 'io.metamask', iosUrlScheme: 'pulsesecure://');
    logger.i(res);
    if (res == true) {
      int value = await LaunchApp.openApp(
        androidPackageName: 'io.metamask',
        iosUrlScheme: 'pulsesecure://',
        appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1438144202',
      );
      logger.i(value);
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        final appId = Platform.isAndroid ? 'io.metamask' : '1438144202';
        final url = Uri.parse(
          Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId",
        );
        launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    }
  }
}

/// never
/// voyage
/// actual
/// submit
/// grid
/// ghost
/// father
/// exotic
/// flower
/// wing
/// ocean
/// morning

/// Super Ex
///
/// bid
/// side
/// offer
/// sister
/// act
/// party
/// brief
/// adult
/// cash
/// rebuild
/// tree
/// error
