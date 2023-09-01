import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Pages/HomePages/qr_scan.dart';
import 'package:virtual_exchange/Pages/HomePages/widgets/home_search.dart';
import 'package:virtual_exchange/Pages/Notification/notification_page.dart';
import 'package:virtual_exchange/Pages/suport_web_view.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/pages/AuthPages/auth_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => LoginPage());
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                FontAwesomeIcons.user,
                color: themeProvider.darkMode ? Colors.white : Colors.black,
                size: size.width / 22.5,
              ),
            ),
          ).paddingOnly(right: 10),
          const HomeSearchWidget(),
        ],
      ),
      actions: [
        GestureDetector(
          child: Icon(
            CupertinoIcons.qrcode_viewfinder,
            color: themeProvider.darkMode ? Colors.white : Colors.black,
            size: 20,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext _) {
                  return const QRViewPage();
                },
              ),
            );
          },
        ).paddingOnly(right: 10),
        GestureDetector(
          child: Icon(
            Icons.headset_mic_outlined,
            color: themeProvider.darkMode ? Colors.white : Colors.black,
            size: 20,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext _) {
              return const SupportWebView();
            }));
          },
        ).paddingOnly(right: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return const Notifications();
                },
              ),
            );
          },
          child: Icon(
            Icons.notifications,
            color: themeProvider.darkMode ? Colors.white : Colors.black,
            size: 20,
          ),
        ).paddingOnly(right: 10),
        GestureDetector(
          onTap: () {
            themeProvider.changeTheme();
          },
          child: Icon(
            Icons.dark_mode,
            color: themeProvider.darkMode ? Colors.white : Colors.black,
            size: 20,
          ),
        ).paddingOnly(right: 20),
      ],
    );
  }
}
