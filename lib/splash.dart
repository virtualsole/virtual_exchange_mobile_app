import 'package:flutter/material.dart';
import 'package:virtual_exchange/Views/LandingPages/landing_page.dart';
import 'package:virtual_exchange/Widgets/image_handler.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const LandingPage();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageRes.appLogoAndText),
          ),
        ),
      ),
    );
  }
}
