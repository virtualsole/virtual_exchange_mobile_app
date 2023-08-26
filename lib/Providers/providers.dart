import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/Providers/AuthProviders/auth_provider.dart';
import 'package:virtual_exchange/Providers/WalletProviders/wallet_provider.dart';
import 'package:virtual_exchange/Providers/global_provider.dart';

GlobalProvider globalProvider = Provider.of<GlobalProvider>(Get.context!, listen: false);
AuthProvider authProvider = Provider.of<AuthProvider>(Get.context!, listen: false);
WalletProvider walletProvider = Provider.of<WalletProvider>(Get.context!, listen: false);
