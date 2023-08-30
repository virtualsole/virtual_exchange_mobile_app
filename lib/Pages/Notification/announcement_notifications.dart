import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sys_notifications.dart';

class AnnouncementNotification extends StatelessWidget {
  const AnnouncementNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Massage",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.withOpacity(.5),
              ),
        ).paddingOnly(top: 10, bottom: 5),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return NotificationCard(
                icon: Icon(
                  Icons.mic_external_on_rounded,
                  color: Colors.grey.withOpacity(.7),
                ).paddingOnly(right: 10),
              );
            },
          ),
        )
      ],
    ).paddingSymmetric(
      horizontal: 10,
    );
  }
}
