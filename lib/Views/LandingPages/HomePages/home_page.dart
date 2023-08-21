// ignore_for_file: deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Views/LandingPages/AppGlobleSettings/app_globle_settings.dart';
import 'package:virtual_exchange/Widgets/HomePage/announcement_and_statics.dart';
import 'package:virtual_exchange/Widgets/HomePage/image_slider.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class AnnouncementValues {
  final String imageRes;
  final String title;

  AnnouncementValues(this.title, this.imageRes);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              GestureDetector(
                  onTap: () => Get.to(() => const AppGlobalSettings()),
                  child: const Text("Login or Register").paddingOnly(left: 10)),
              const Expanded(child: SizedBox.shrink()),
              const Icon(Icons.search).paddingOnly(left: 10),
              const Icon(Icons.qr_code).paddingOnly(left: 10),
              const Icon(Icons.notifications).paddingOnly(left: 10),
            ],
          ).paddingAll(10),
          const ImageSlider(),
          const AnnouncementAndStatics().paddingOnly(bottom: 10),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Virtual Wallet",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w700)),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.greenColor, borderRadius: BorderRadius.circular(50)),
                      child: const Text("Secure").paddingSymmetric(horizontal: 10),
                    ).paddingOnly(left: 10)
                  ],
                ),
                Text(
                  "Store private key",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.greyText),
                ).paddingOnly(top: 10)
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 15),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .23,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                AnnouncementValues("Super Start", ImageRes.superStart),
                AnnouncementValues("Academy", ImageRes.academy),
                AnnouncementValues("Deposit", ImageRes.deposit),
                AnnouncementValues("Referral", ImageRes.referral),
                AnnouncementValues("Mystery Box", ImageRes.mysteryBox),
                AnnouncementValues("1 Vusd", ImageRes.oneVUsd),
                AnnouncementValues("Spot Trading", ImageRes.spotTrading),
                AnnouncementValues("P2P", ImageRes.p2p),
                AnnouncementValues("Futures", ImageRes.future),
                AnnouncementValues("Order", ImageRes.order),
                AnnouncementValues("Help Center", ImageRes.chatSupport),
              ]
                  .map(
                    (e) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: SvgPicture.asset(
                            e.imageRes,
                            height: 30,
                            width: 30,
                            color: Theme.of(context).cardColor,
                            fit: BoxFit.fill,
                          ).paddingAll(5),
                        ),
                        Text(e.title,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10))
                      ],
                    ),
                  )
                  .toList(),
            ),
          ).paddingSymmetric(vertical: 10),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Event Center",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue, borderRadius: BorderRadius.circular(2.5)),
                      child: const Text("HOT").paddingSymmetric(horizontal: 7.5, vertical: 0),
                    ).paddingOnly(left: 10)
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: SizedBox(
                    height: 20,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('Congratulations to 27****67 for acquiring 100 USDT!',
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.greyText)),
                        RotateAnimatedText('Congratulations to 27****509 for acquiring 50 USDT!',
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.greyText)),
                      ],
                      repeatForever: true,
                    ),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 20),
          ),
        ],
      ),
    );
  }
}
