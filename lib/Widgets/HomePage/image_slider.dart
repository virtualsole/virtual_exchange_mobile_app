import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imagesList
              .map(
                (e) => CachedNetworkImage(
                  imageUrl: e,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Skeleton(
                    isLoading: true,
                    skeleton: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          height: 200, width: MediaQuery.of(context).size.width),
                    ),
                    child: Center(
                        child: Container(
                      decoration: const BoxDecoration(),
                    )),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
              .toList(),
          options: CarouselOptions(
            onPageChanged: (int index, res) {
              currentIndex = index;
              setState(() {});
            },
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            height: 150,
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    imagesList.length,
                    (index) => Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: index == currentIndex
                                  ? Colors.white
                                  : Colors.grey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(100)),
                        ).paddingAll(2)),
              ),
            ))
      ],
    );
  }

  final List<String> imagesList = <String>[
    "https://images.livemint.com/img/2023/03/13/1600x900/Day_trading_guide_Stock_market_news_1678667548170_1678667548474_1678667548474.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_1-pQYnWHROntaIvAUELHllyKBHe9lUgJ8w&usqp=CAU",
    "https://i0.wp.com/www.globaltrademag.com/wp-content/uploads/2020/12/Untitled-design.png?fit=757%2C393&ssl=1",
    "https://s31898.pcdn.co/wp-content/uploads/2022/10/AdobeStock_416057612-e1665052015417-800x430.jpg"
  ];
}
