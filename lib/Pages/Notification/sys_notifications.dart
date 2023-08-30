import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/app_theme.dart';

class SystemNotifications extends StatelessWidget {
  const SystemNotifications({super.key});

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
                  CupertinoIcons.chat_bubble_text,
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

class NotificationCard extends StatelessWidget {
  final Widget? icon;
  const NotificationCard({this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      color: Colors.grey.withOpacity(.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    unreadSymbol(),
                    Text(
                      "Notification Title",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ).paddingOnly(bottom: 5),
                Text(
                  "lorum ipus lorum ipus lorum ipus lorum ipus "
                  "lorum ipus lorum ipus lorum ipus lorum ipus "
                  "lorum ipus lorum ipus lorum ipus lorum ipus lorum ipus "
                  "lorum ipus lorum ipus lorum ipus lorum ipuslorum ipus "
                  "lorum ipus ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey.withOpacity(.7)),
                ).paddingOnly(bottom: 20),
                Text(
                  DateTime.now().toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 10, color: Colors.grey.withOpacity(.7)),
                )
              ],
            ),
          )
        ],
      ).paddingSymmetric(vertical: 10, horizontal: 10),
    ).paddingSymmetric(vertical: 5);
  }

  Widget unreadSymbol() {
    return CircleAvatar(
      radius: 5,
      backgroundColor: AppColors.primaryColor,
    ).paddingOnly(right: 5);
  }
}
