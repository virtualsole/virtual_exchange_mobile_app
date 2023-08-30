import 'package:flutter/material.dart';
import 'package:virtual_exchange/Pages/Notification/announcement_notifications.dart';
import 'package:virtual_exchange/Pages/Notification/campaign_notifications.dart';
import 'package:virtual_exchange/Pages/Notification/sys_notifications.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/app_theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          bottom: TabBar(
            tabs: [
              "System",
              "Announcement",
              "Campaign",
            ]
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
            labelStyle: Theme.of(context).textTheme.bodySmall,
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: themeProvider.darkMode ? Colors.white : Colors.black,
                size: 20,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            const SystemNotifications(),
            const AnnouncementNotification(),
            CampaignNotifications()
          ],
        ),
      ),
    );
  }
}
