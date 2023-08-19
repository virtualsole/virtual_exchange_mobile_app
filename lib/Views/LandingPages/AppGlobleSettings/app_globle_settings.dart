import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:virtual_exchange/Providers/global_provider.dart';
import 'package:virtual_exchange/Views/AuthPages/auth_page.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AppGlobalSettings extends StatelessWidget {
  const AppGlobalSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<GlobalProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(
              Provider.of<GlobalProvider>(context, listen: false).isDarkMode == true
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.headphones,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to ${AppConst.appName}!",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            "Web3 cryptocurrency exchange",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(
                  color: AppColors.greyText,
                ),
          ).paddingOnly(bottom: 30),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  "Log In or Register",
                  onTap: () => Get.to(
                    () => const LoginPage(),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: AppButton(
                  "Connect Wallet",
                  onTap: () {},
                  buttonColor: Colors.white,
                  titleColor: Colors.black,
                ),
              ),
            ],
          ).paddingOnly(bottom: 30),
          ListTile(
            dense: true,
            onTap: () {},
            leading: const Icon(Icons.task),
            title: const Text("Task Center"),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
            ),
          ),
          ListTile(
            dense: true,
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
            ),
          ),
          ListTile(
            dense: true,
            onTap: () {},
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            trailing: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "English",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 10,
                ),
              ],
            ),
          ).paddingOnly(bottom: 10),
          Container(height: 1, color: Colors.grey).paddingOnly(bottom: 10),
          ListTile(
            dense: true,
            onTap: () {},
            leading: const Icon(Icons.support),
            title: const Text("FAQ"),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
            ),
          ),
          ListTile(
            dense: true,
            onTap: () {},
            leading: const Icon(Icons.network_check),
            title: const Text("Network Test"),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
            ),
          ),
          ListTile(
            dense: true,
            onTap: () {},
            leading: const Icon(Icons.share),
            title: const Text("Share App"),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 10,
            ),
          ),
        ],
      ).paddingAll(20),
    );
  }
}
