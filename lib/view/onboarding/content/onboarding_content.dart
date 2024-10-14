import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int height = 300;

class OnboardingContent {
  final String title;
  final String subtitle;
  final Widget animations;

  OnboardingContent(
      {required this.title, required this.subtitle, required this.animations});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: "Learn at Your Own Pace",
      subtitle:
          "Live sessions with recorded classes for easy revision, plus 24/7 mentors to solve your doubts anytime!",
      animations: Image.asset(
        "assets/images/on1.png",
        height: ScreenUtil().setHeight(height),
      )),
  OnboardingContent(
      title: "Become a Professional!",
      subtitle: "Study smart with world-class teachers and access high-quality content anywhere, anytime!",
      animations: Image.asset(
        "assets/images/Nerd-amico.png",
        height: ScreenUtil().setHeight(height),
      )),
  OnboardingContent(
      title: "Land Your Dream Job!",
      subtitle:
          "Study with us, connect with top-tier companies, and get your investment back through career success!",
      animations: Image.asset(
        "assets/images/Business deal-amico.png",
        height: ScreenUtil().setHeight(height),
      )),
];
