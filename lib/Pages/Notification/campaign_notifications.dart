import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignNotifications extends StatelessWidget {
  CampaignNotifications({super.key});

  final List imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq_5VpdtZ8TDPpG1B5E9TAcbCgz1l10joxMw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQksGYjFxzY0ClfferWS3_FA83Sjyd8yhPgCw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJO51rTdGAi2z2z8MkQuhRuLV0RFuAFM42Rw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvy2tSrJ7nPZetcBk9l9zq6bh6okbtR8jJJw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2qyzS6LPb0UaeBjiK_HruTOduID7FSMf1Cg&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imgList[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ).paddingOnly(bottom: 10),
                Text(
                  "Lorum impus Lorum impus Lorum impus Lorum impus"
                  " Lorum impus Lorum impus Lorum impus Lorum impus "
                  " Lorum impus Lorum impus Lorum impus Lorum impus "
                  " Lorum impus Lorum impus Lorum impus Lorum impus "
                  "Lorum impus Lorum impus Lorum impus Lorum impus ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ).paddingOnly(bottom: 20);
          },
        )),
      ],
    ).paddingSymmetric(horizontal: 10, vertical: 10);
  }
}
