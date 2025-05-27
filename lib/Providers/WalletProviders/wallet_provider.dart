import 'dart:io';

// import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../utils.dart';

class WalletProvider extends ChangeNotifier {
  // final String _address = "0x1779Ae1F8E700Fbf16E7ebfcc27f8C4936fbFDd3";

  void connectWallet() async {
    try {
      // final httpClient = http.Client();

      // final ethClient = Web3Client(ApiUrls.BASE_URL, httpClient);

      // final credentials = EthPrivateKey.fromHex(_address);
      // final address = credentials.address;

      // EtherAmount balance = await ethClient.getBalance(address);
    } on Exception catch (e) {
      logger.e(e);
      throw Exception(e);
    }

    // logger.i(balance.getValueInUnit(EtherUnit.ether));
  }

  void launchMetaMask() async {
    // bool? res = await LaunchApp.isAppInstalled(
    //     androidPackageName: 'io.metamask', iosUrlScheme: 'pulsesecure://');
    // logger.i(res);
    // if (res == true) {
    //   int value = await LaunchApp.openApp(
    //     androidPackageName: 'io.metamask',
    //     iosUrlScheme: 'pulsesecure://',
    //     appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1438144202',
    //   );
    //   logger.i(value);
    // } else {
    //   if (Platform.isAndroid || Platform.isIOS) {
    //     final appId = Platform.isAndroid ? 'io.metamask' : '1438144202';
    //     final url = Uri.parse(
    //       Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId",
    //     );
    //     launchUrl(
    //       url,
    //       mode: LaunchMode.externalApplication,
    //     );
    //   }
    // }
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
