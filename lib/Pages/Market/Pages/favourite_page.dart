import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_exchange/Widgets/app_button.dart';
import 'package:virtual_exchange/app_theme.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            "Add Favourite",
            onTap: () {},
          ).paddingAll(10),
          TextButton(
              onPressed: () {},
              child: Text(
                "Add Another Pair",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff27313C).withOpacity(.5),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Popular Pair",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
            ).paddingOnly(left: 20),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                childAspectRatio: (1 / .5),
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(
                  10,
                  (index) => Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff27313C),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "BNB",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "/USDT",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Text(
                          "214.2",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "+0.05%",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.greenColor,
                                  ),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 10,
                              child: const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).paddingOnly(top: 30),
    );
  }

// Widget _buildFavouriteCard(context) {
//   final size = MediaQuery.of(context).size;
//   return Container(
//     padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'VRC/',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyMedium
//                           ?.copyWith(fontWeight: FontWeight.w400),
//                     ),
//                     TextSpan(
//                       text: 'BTC',
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyMedium
//                           ?.copyWith(fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 2.5,
//               ),
//               Text(
//                 'Volume: 72.837',
//                 style: TextStyle(
//                   fontSize: size.width / 28.0,
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '0.000000031',
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 padding: const EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 12.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF00FF80).withOpacity(.15),
//                   borderRadius: BorderRadius.circular(4.0),
//                 ),
//                 child: Text(
//                   '+3.33%',
//                   style: TextStyle(
//                     fontSize: size.width / 30.0,
//                     color: const Color(0xFF00FF80),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
}
