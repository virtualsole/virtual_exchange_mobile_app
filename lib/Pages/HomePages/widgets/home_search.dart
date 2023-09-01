import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:virtual_exchange/Data/type_coin.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/utlis.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.3), borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.search,
            color: themeProvider.darkMode ? Colors.white : Colors.black,
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
            child: AnimatedTextKit(
              animatedTexts: btcs
                  .map((e) => FadeAnimatedText(e, textStyle: Theme.of(context).textTheme.bodySmall))
                  .toList(),
              repeatForever: true,
              onTap: () {
                logger.i("Tap Event");
              },
            ),
          ),
        ],
      ),
    );
  }
}
