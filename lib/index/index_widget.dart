import 'package:flutter/material.dart';
import 'OnbordingData.dart';
import 'flutteronboardingscreens.dart';

class IndexWidget extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/login-bg.jpg",
      title: "Do More With Brave!",
      desc:
          "Brave is a production system which gives control over inventory, use of assets while optimizing the whole team for maximum output",
    ),
    OnbordingData(
      imagePath: "assets/images/login-bg.jpg",
      title: "At Your Finger Tips..",
      desc:
          "Track and Monitor Production Activities",
    ),
    OnbordingData(
      imagePath: "assets/images/login-bg.jpg",
      title: "Stream and Listen!",
      desc:
          "Watch Live TV or Listen to Live Radio",

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      list,
      MaterialPageRoute(builder: (context) => IndexWidget()),
    );
  }
}